# frozen_string_literal: true

require 'spec_helper'

Client = GhostRb::Client
PostsController = GhostRb::Controllers::PostsController
RequestError = GhostRb::Errors::RequestError
Post = GhostRb::Resources::Post

RSpec.describe PostsController, integration: true do
  let(:ctrl) do
    client = Client.new(ENV['URL'],
                        ENV['CLIENT_ID'],
                        ENV['CLIENT_SECRET'])
    PostsController.new(client)
  end

  context '#new' do
    it 'does not throw exception' do
      expect { ctrl }.not_to raise_error
    end
  end

  context '#all' do
    it 'returns posts array' do
      posts = ctrl.all

      expect(posts).to be_a(Array)
      expect(posts[0]).to be_a(Post)
    end
  end

  context '#limit' do
    it 'returns 1 post' do
      expect(ctrl.limit(1).all.size).to eql(1)
    end
  end

  context '#find_by' do
    it 'throws GhostRb::Errors::RequestError with invalid id' do
      expect { ctrl.find_by(id: -1) }.to raise_error(RequestError)
    end

    it 'throws GhostRb::Errors::RequestError with invalid slug' do
      expect { ctrl.find_by(slug: 'not-present') }.to raise_error(RequestError)
    end
  end
end
