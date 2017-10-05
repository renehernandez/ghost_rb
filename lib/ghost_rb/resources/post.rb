# frozen_string_literal: true

module GhostRb
  module Resources
    # @author Rene Hernandez
    # @since 0.1
    class Post < BaseResource
      attr_accessor :id, :title, :slug, :html, :page,
                    :status, :published_at, :created_at, :author_id,
                    :visibility, :featured, :plaintext, :author, :tags

      alias page? page

      alias featured? featured

      def self.generate(hash)
        inst = super(hash)
        inst.author = User.generate(hash[:author]) if hash.key?(:author)
        inst.tags = hash[:tags].map { |t| Tag.generate(t) } if hash.key?(:tags)

        inst
      end
    end
  end
end
