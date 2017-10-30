# frozen_string_literal: true

module GhostRb
  module Support
    # Provides indifferent access for symbol and string keys.
    # Both :bar and "bar" are considered to be the same key.
    # This is implementation is heavily based on the [ActiveSupport implementation]{http://api.rubyonrails.org/classes/ActiveSupport/HashWithIndifferentAccess.html}
    # @author Rene Hernandez
    # @since 0.3
    class HashWithIndifferentAccess < Hash
      
      def key?(key)
        
      end

      private
      def convert_key(key)
        key.kind_of?(Symbol) ? key.to_s : key
      end

    end
  end
end
