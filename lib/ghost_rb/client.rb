# frozen_string_literal: true

require 'httpclient'
require 'uri'
require 'json'

module GhostRb
  # @author Rene Hernandez
  # @since 0.1
  class Client
    attr_reader :base_url, :client_id, :client_secret, :default_query

    def initialize(base_url, client_id, client_secret)
      @base_url = URI.join(base_url, 'ghost/', 'api/', 'v0.1/')
      @client_id = client_id
      @client_secret = client_secret
      @http = HTTPClient.new(base_url: @base_url)
      @default_query = { client_id: @client_id, client_secret: @client_secret }
    end

    def get_posts(limit = 'all', include = 'tags,author')
      query = @default_query.merge(limit: limit, include: include)

      get_resources('posts', query, GhostRb::Resources::Post)
    end

    def get_tags(limit = 'all', include = 'count.posts')
      query = @default_query.merge(limit: limit, include: include)

      get_resources('tags', query, GhostRb::Resources::Tag)
    end

    private

    def get_resources(resource, query, klass)
      response = @http.get(resource, query, {}, follow_redirect: true)
      content = JSON.parse(response.body)

      [response.status_code, map_to(content[resource], klass)]
    end

    def map_to(data, klass)
      data.map { |entry| klass.generate(entry) }
    end
  end
end
