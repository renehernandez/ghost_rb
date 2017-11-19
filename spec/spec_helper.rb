# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'ghost_rb'

Client = GhostRb::Client
PostsController = GhostRb::Controllers::PostsController
TagsController = GhostRb::Controllers::TagsController
UsersController = GhostRb::Controllers::UsersController
RequestError = GhostRb::Errors::RequestError
Post = GhostRb::Resources::Post
User = GhostRb::Resources::User
Tag = GhostRb::Resources::Tag

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
