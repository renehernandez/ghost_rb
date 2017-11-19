# frozen_string_literal: true

module GhostRb
  module Controllers

    # @author Rene Hernandez
    # @since 0.3
    class UsersController < BaseController
      attr_reader :endpoint, :resource_klass

      def initialize(client, params = nil)
        super
        @endpoint = 'users'
        @resource_klass = Resources::User
      end

      private

      def raise_fetch_single_error(kvp, status, errors)
        key = kvp.key?(:id) ? :id : :slug
        message = "Unable to fetch user with #{key} = #{kvp[key]}"
        raise Errors::RequestError.new(message,
                                       status,
                                       errors)
      end

      def raise_fetch_list_error(status, errors)
        raise Errors::RequestError.new('Unable to fetch users',
                                       status,
                                       errors)
      end

    end
  end
end