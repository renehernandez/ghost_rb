# frozen_string_literal: true

module GhostRb
  module Resources
    # @author Rene Hernandez
    # @since 0.1
    class Post < BaseResource
      attr_accessor :id, :title, :slug, :html, :page,
                    :status, :published_at, :created_at, :author,
                    :visibility, :featured, :plaintext, :tags

      alias page? page

      alias featured? featured

      def self.generate(data)
        inst = super(data)
        inst.author = User.generate(data[:author]) if hash_value?(data, :author)
        inst.tags = data[:tags].map { |t| Tag.generate(t) } if data.key?(:tags)

        inst
      end
    end
  end
end
