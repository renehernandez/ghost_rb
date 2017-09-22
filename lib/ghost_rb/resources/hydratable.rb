# frozen_literal_string: true

module GhostRb
  module Resources
    module Hydratable

      def hydrate(hash)
        hash.each do |k, v| 
          method_symbol = "#{k}=".to_sym
          self.public_send(method_symbol, v) if self.respond_to?(method_symbol)
        end
      end
    end
  end
end