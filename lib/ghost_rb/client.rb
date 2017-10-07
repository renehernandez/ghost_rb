# frozen_string_literal: true

require 'httpclient'
require 'uri'
require 'json'

module GhostRb
  # @author Rene Hernandez
  # @since 0.1
  class Client
    attr_reader :base_url, :client_id, :client_secret, :default_query

    REQUEST_OK = 200

    def initialize(base_url, client_id, client_secret)
      @base_url = URI.join(base_url, 'ghost/', 'api/', 'v0.1/')
      @client_id = client_id
      @client_secret = client_secret
      @http = HTTPClient.new(base_url: @base_url)
      @default_query = { client_id: @client_id, client_secret: @client_secret }
    end

    def posts
      Controllers::PostsController.new(self)
    end

    def tags
      Controllers::TagsController.new(self)
    end

    def get(endpoint, query)
      response = @http.get(endpoint, query, {}, follow_redirect: true)
      content = JSON.parse(response.body)
      [response.status_code, content]
    end
  end
end
