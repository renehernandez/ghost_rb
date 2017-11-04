# frozen_string_literal: true

require 'spec_helper'

Client = GhostRb::Client
PostsController = GhostRb::Controllers::PostsController
TagsController = GhostRb::Controllers::TagsController

RSpec.describe Client do
  let(:dummy_client) do
    Client.new('https://example.com',
               'hello',
               'world')
  end

  let(:client) do
    Client.new(ENV['URL'],
               ENV['CLIENT_ID'],
               ENV['CLIENT_SECRET'])
  end

  context '#new' do
    it 'does not raise error' do
      expect { dummy_client }.not_to raise_error
    end
  end

  context '#posts' do
    it 'returns instance of GhostRb::Controllers::PostsController' do
      ctrl = client.posts

      expect(ctrl.class).to eql(PostsController)
    end
  end

  context '#tags' do
    it 'returns instance of GhostRb::Controllers::TagsController' do
      ctrl = client.tags

      expect(ctrl).to be_a(TagsController)
    end
  end

  context '#get' do
    it 'returns pair status, content' do
      status, content = client.get('posts', client_id: ENV['CLIENT_ID'],
                                            client_secret: ENV['CLIENT_SECRET'],
                                            limit: 'all')
      expect(status).to eql(200)
      expect(content['posts']).not_to be_nil
    end
  end
end
