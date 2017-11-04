# frozen_string_literal: true

module GhostRb
  module Support
    # rubocop:disable Metrics/LineLength
    # Provides indifferent access for symbol and string keys.
    # Both :bar and "bar" are considered to be the same key.
    # This is implementation is heavily based on the
    # [ActiveSupport implementation]{http://api.rubyonrails.org/classes/ActiveSupport/HashWithIndifferentAccess.html}
    # @author Rene Hernandez
    # @since 0.2.3
    # rubocop:enable Metrics/LineLength
    class HashWithIndifferentAccess < Hash
      def initialize(data = {})
        if data.respond_to?(:to_hash)
          super()
          update(data)

          hash = data.to_hash
          self.default = hash.default if hash.default
          self.default_proc = hash.default_proc if hash.default_proc
        else
          super(data)
        end
      end

      def [](key)
        super(convert_key(key))
      end

      alias regular_writer []= unless method_defined?(:regular_writer)

      def []=(key, value)
        regular_writer(convert_key(key), convert_value(value))
      end

      def dup
        self.class.new(self).tap do |new_hash|
          add_defaults(new_hash)
        end
      end

      def default(*args)
        super(*args.map { |arg| convert_key(arg) })
      end

      def delete(key)
        super(convert_key(key))
      end

      def fetch(key, *extras)
        super(convert_key(key), *extras)
      end

      def key?(key)
        super(convert_key(key))
      end

      alias has_key? key?

      alias include? key?

      def update(other_hash)
        if other_hash.is_a? HashWithIndifferentAccess
          super(other_hash)
        else
          other_hash.to_hash.each_pair do |key, value|
            if block_given? && key?(key)
              value = yield(convert_key(key), self[key], value)
            end
            regular_writer(convert_key(key), convert_value(value))
          end
          self
        end
      end

      alias merge! update

      def merge(hash, &block)
        dup.update(hash, &block)
      end

      def to_hash
        new_hash = {}
        add_defaults(new_hash)

        each do |key, value|
          new_hash[key] = convert_value(value)
        end
        new_hash
      end

      private

      def convert_key(key)
        key.is_a?(Symbol) ? key.to_s : key
      end

      def convert_value(value)
        return self.class.new(value) if value.is_a? Hash

        return value.map { |e| convert_value(e) } if value.is_a?(Array)

        value
      end

      def add_defaults(target) # :doc:
        if default_proc
          target.default_proc = default_proc.dup
        else
          target.default = default
        end
      end
    end
  end
end
