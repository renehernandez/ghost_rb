# frozen_string_literal: true

require 'uri'

module GhostRb
  # @author Rene Hernandez
  # @since 0.2
  module Controllers
    # @author Rene Hernandez
    # @since 0.2
    class BaseController
      attr_reader :client, :params

      def initialize(client)
        @client = client
        @params = Support::HashWithIndifferentAccess.new
      end

      def all
        fetch_list.map { |r| @resource_klass.generate(r) }
      end

      def limit(limit)
        where(limit: limit)
      end

      def page(page)
        where(page: page)
      end

      def order(order_str)
        where(order: order_str)
      end

      def fields(fields_str)
        where(fields: fields_str)
      end

      def filter(filter_query)
        where(filter: filter_query)
      end

      def include(resources_str)
        where(include: resources_str)
      end

      def where(hash)
        @params.merge!(hash)
        self
      end

      def find_by(kvp)
        @params.keys.reject { |k| k == :include }.each do |key|
          @params.delete(key)
        end

        content = fetch_single(kvp)
        resource_klass.generate(content)
      end

      private

      def fetch_single(kvp)
        endpoint = format_endpoint(kvp)
        query = client.default_query.merge(@params)
        status, content = client.get(endpoint, query)

        if error?(status)
          raise_fetch_single_error(kvp, status, content['errors'])
        end

        content
      end

      def fetch_list
        query = client.default_query.merge(@params)
        status, content = client.get(endpoint, query)

        raise_fetch_list_error(status, content['errors']) if error?(status)

        content[@endpoint]
      end

      def error?(status)
        status >= 400
      end

      def format_endpoint(kvp)
        return [endpoint, kvp[:id]].join('/') if kvp.key?(:id)
        return [endpoint, 'slug', kvp[:slug]].join('/') if kvp.key?(:slug)

        raise Errors::InvalidEndpointError,
              "Invalid endpoint for #{endpoint}. Should be either :id or :slug"
      end
    end
  end
end
