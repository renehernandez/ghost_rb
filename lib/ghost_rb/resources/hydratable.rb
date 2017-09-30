# frozen_string_literal: true

module GhostRb
  module Resources
    # @author Rene Hernandez
    # @since 0.1
    module Hydratable
      def hydrate(hash)
        hash.each do |k, v|
          method_symbol = "#{k}=".to_sym
          public_send(method_symbol, v) if respond_to?(method_symbol)
        end
      end
    end
  end
end
