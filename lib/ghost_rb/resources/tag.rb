# frozen_literal_string: true

module GhostRb
  module Resources
    class Tag < BaseResource

      attr_accessor :id, :name, :slug, :visibility
      
    end
  end
end