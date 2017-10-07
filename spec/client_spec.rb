# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GhostRb::Client, integration: true do
  let(:dummy_client) do
    GhostRb::Client.new('https://example.com',
                        'hello',
                        'world')
  end

  let(:client) do
    GhostRb::Client.new(ENV['URL'],
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

      expect(ctrl.class).to eql(GhostRb::Controllers::PostsController)
    end
  end

  context '#tags' do
    it 'returns instance of GhostRb::Controllers::TagsController' do
      ctrl = client.tags

      expect(ctrl).to be_a(GhostRb::Controllers::TagsController)
    end
  end
end
