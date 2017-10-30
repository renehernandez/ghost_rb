# frozen_string_literal: true

module GhostRb
  module Support
    # Provides indifferent access for symbol and string keys.
    # Both :bar and "bar" are considered to be the same key.
    # This is implementation is heavily based on the
    # [ActiveSupport implementation]{http://api.rubyonrails.org/classes/ActiveSupport/HashWithIndifferentAccess.html}
    # @author Rene Hernandez
    # @since 0.3
    class HashWithIndifferentAccess < Hash
      def initialize(constructor = {})
        if constructor.respond_to?(:to_hash)
          super()
          update(constructor)

          hash = constructor.to_hash
          self.default = hash.default if hash.default
          self.default_proc = hash.default_proc if hash.default_proc
        else
          super(constructor)
        end
      end

      def [](key)
        super(convert_key(key))
      end

      alias regular_writer []= unless method_defined?(:regular_writer)

      def []=(key, value)
        regular_writer(convert_key(key), convert_value(value, for: :assignment))
      end

      def dup
        self.class.new(self).tap do |new_hash|
          add_defaults(new_hash)
        end
      end

      def key?(key)
        super(convert_key(key))
      end

      alias has_key? key?

      alias include? key?

      def delete(key)
        super(convert_key(key))
      end

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
        add_defaults(_new_hash)

        each do |key, value|
          new_hash[key] = convert_value(value, for: :to_hash)
        end
        new_hash
      end

      def nested_under_indifferent_access
        self
      end

      private

      def convert_key(key)
        key.is_a?(Symbol) ? key.to_s : key
      end

      def convert_value(value, options = {}) # :doc:
        if value.is_a? Hash
          if options[:for] == :to_hash
            value.to_hash
          else
            value.nested_under_indifferent_access
          end
        elsif value.is_a?(Array)
          value = value.dup if options[:for] != :assignment || value.frozen?
          value.map! { |e| convert_value(e, options) }
        else
          value
        end
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
