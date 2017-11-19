# frozen_string_literal: true

module GhostRb
  module Controllers
    # @author Rene Hernandez
    # @since 0.2
    class PostsController < BaseController
      attr_reader :endpoint, :resource_klass

      def initialize(client, params = nil)
        super
        @endpoint = 'posts'
        @resource_klass = Resources::Post
      end

      def formats(formats)
        where(formats: formats)
      end

      private

      def raise_fetch_single_error(kvp, status, errors)
        key = kvp.key?(:id) ? :id : :slug
        message = "Unable to fetch post with #{key} = #{kvp[key]}"
        raise Errors::RequestError.new(message,
                                       status,
                                       errors)
      end

      def raise_fetch_list_error(status, errors)
        raise Errors::RequestError.new('Unable to fetch posts',
                                       status,
                                       errors)
      end
    end
  end
end
