# frozen_literal_string: true

module GhostRb
  module Resources
    # @author Rene Hernandez
    # @since 0.1
    class Tag < BaseResource

      attr_accessor :id, :name, :slug, :visibility, :posts_count

      def self.generate(hash)
        inst = super(hash)
        inst.posts_count = hash[:count][:posts].to_i if hash.key?(:count)

        inst
      end
      
    end
  end
end