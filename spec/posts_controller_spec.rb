# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GhostRb::Controllers::PostsController do
  let(:ctrl) do
    client = GhostRb::Client.new(ENV['URL'],
                          ENV['CLIENT_ID'],
                          ENV['CLIENT_SECRET'])
    GhostRb::Controllers::PostsController.new(client)
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
      expect(posts[0]).to be_a(GhostRb::Resources::Post)
    end
  end

  context '#find' do 
    it 'throws GhostRb::Errors::RequestError ' do
      expect { ctrl.find(-1) }.to raise_error(GhostRb::Errors::RequestError)
    end
  end
end
