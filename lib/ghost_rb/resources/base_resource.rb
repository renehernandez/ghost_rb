# frozen_string_literal: true

module GhostRb
  # @author Rene Hernandez
  # @since 0.1
  module Resources
    # @author Rene Hernandez
    # @since 0.1
    class BaseResource
      include Hydratable

      def self.generate(hash)
        res_instance = new
        res_instance.hydrate(hash)
        res_instance
      end
    end
  end
end
