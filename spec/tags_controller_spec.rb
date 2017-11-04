# frozen_string_literal: true

require 'spec_helper'

Client = GhostRb::Client
TagsController = GhostRb::Controllers::TagsController
RequestError = GhostRb::Errors::RequestError
Tag = GhostRb::Resources::Tag

RSpec.describe TagsController do
  let(:ctrl) do
    client = Client.new(ENV['URL'],
                        ENV['CLIENT_ID'],
                        ENV['CLIENT_SECRET'])
    TagsController.new(client)
  end

  context '#new' do
    it 'does not throw exception' do
      expect { ctrl }.not_to raise_error
    end
  end

  context '#all' do
    it 'returns tags array' do
      tags = ctrl.all

      expect(tags).to be_a(Array)
      expect(tags[0]).to be_a(Tag)
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
