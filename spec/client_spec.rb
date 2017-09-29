# frozen_literal_string: true

require 'spec_helper'

RSpec.describe GhostRb::Client, integration: true do
  let(:dummy_client) do
    GhostRb::Client.new('https://example.com', 
                        'hello', 'world'
                      )
  end

  let(:client) do
    GhostRb::Client.new(ENV['URL'], 
                        ENV['CLIENT_ID'],
                        ENV['CLIENT_SECRET'])
  end


  context '#new' do
    it 'is does not raise error' do
      expect { dummy_client }.not_to raise_error
    end
  end

  context '#get_posts' do
    it 'post is of type GhostRb::Resources::Post' do
      status, posts = client.get_posts(1)

      expect(status).to eql(200)
      expect(posts[0].class).to be GhostRb::Resources::Post
    end
  end

  context '#get_tags' do
    it 'tag is of type GhostRb::Resources::Tag' do
      status, tags = client.get_tags(1)

      expect(status).to eql(200)
      expect(tags[0].class).to be GhostRb::Resources::Tag
    end
  end

end