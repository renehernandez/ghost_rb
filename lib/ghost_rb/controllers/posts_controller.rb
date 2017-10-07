# frozen_string_literal: true

module GhostRb
  module Controllers
    # @author Rene Hernandez
    # @since 0.2
    class PostsController < BaseController
      attr_reader :endpoint, :resource_klass

      def initialize(client)
        super
        @endpoint = 'posts'
        @resource_klass = Resources::Post
      end

      def all
        fetch_list['posts'].map { |r| @resource_klass.generate(r) }
      end

      private

      def raise_fetch_single_error(id, status, errors)
        raise Errors::RequestError.new("Unable to fetch post with id = #{id}",
                                   status,
                                   errors)
      end

      def raise_fetch_list_error(status, errors)
        raise Errors::RequestError.new("Unable to fetch posts",
                              status,
                              errors)
      end
    end
  end
end
