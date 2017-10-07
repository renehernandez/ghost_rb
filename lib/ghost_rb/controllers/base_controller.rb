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
        @params = {}
      end

      def limit(limit)
        @params[:limit] = limit
        self
      end

      def page(page)
        @params[:page] = page
        self
      end

      def order(str)
        @params[:order] = str
        self
      end

      def fields(str)
        @params[:fields] = str
        self
      end

      def include(str)
        @params[:include] = str
        self
      end

      def where(hash = {})
        @params.merge!(hash)
        self
      end

      def find(id)
        @params.keys.reject { |k| k == :include }.each do |key|
          @params.delete(key)
        end

        fetch_single(id)
      end

      private

      def fetch_single(id)
        query = client.default_query.merge(@params)
        status, content = client.get([endpoint, id].join('/'), query)

        if error?(status)
          raise_fetch_single_error(id, status, content['errors'])
        end

        resource_klass.generate(content)
      end

      def fetch_list
        query = client.default_query.merge(@params)
        status, content = client.get(endpoint, query)

        if error?(status)
          raise_fetch_list_error(status, content['errors'])
        end

        content
      end

      def error?(status)
        status >= 400
      end
    end
  end
end
