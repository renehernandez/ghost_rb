# frozen_string_literal: true

module GhostRb
  module Controllers
    # @author Rene Hernandez
    # @since 0.2
    class TagsController < BaseController
      attr_reader :endpoint, :resource_klass

      def initialize(client)
        super
        @endpoint = 'tags'
        @resource_klass = Resources::Tag
      end

      def all
        fetch_list['tags'].map { |r| @resource_klass.generate(r) }
      end

      private

      def raise_fetch_single_error(id, status, errors)
        raise Errors::RequestError.new("Unable to fetch tag with id = #{id}",
                                   status,
                                   errors)
      end

      def raise_fetch_list_error(status, errors)
        raise Errors::RequestError.new("Unable to fetch tags",
                              status,
                              errors)
      end
    end
  end
end
