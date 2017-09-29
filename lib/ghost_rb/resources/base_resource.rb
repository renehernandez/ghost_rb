# frozen_literal_string: true

module GhostRb
  module Resources
    # @author Rene Hernandez
    # @since 0.1
    class BaseResource
      include Hydratable

      def self.generate(hash)
        res_instance = self.new
        res_instance.hydrate(hash)
        res_instance
      end
    end
  end
end