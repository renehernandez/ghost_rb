# frozen_literal_string: true

module GhostRb
  module Resources
    class Post < BaseResource
      
      attr_accessor :id, :title, :slug, :html, :tags, :page,
                    :status, :published_at, :created_at, :author_id,
                    :visibility, :featured, :plaintext
                    
      def page?
        self.page
      end

      def featured?
        self.featured
      end
      
    end
  end
end