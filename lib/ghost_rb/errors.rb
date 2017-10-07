# frozen_string_literal: true

module GhostRb
  # @author Rene Hernandez
  # @since 0.2
  module Errors
    # @author Rene Hernandez
    # @since 0.2
    class RequestError < StandardError
      attr_reader :status, :errors

      def initialize(message, status, errors)
        super(message)
        @status = status
        @errors = errors
      end
    end
  end
end
