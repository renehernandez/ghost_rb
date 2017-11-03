# frozen_string_literal: true

module GhostRb
  # @author Rene Hernandez
  # @since 0.1
  module Resources
    # @author Rene Hernandez
    # @since 0.1
    class BaseResource
      include Support::Hydratable

      def self.generate(hash)
        res_instance = new
        res_instance.hydrate(hash)
        res_instance
      end

      def self.hash_value?(data, key)
        data.key?(key) && data[key].is_a?(Hash)
      end
    end
  end
end
