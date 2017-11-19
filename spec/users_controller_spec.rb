# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersController do
  let(:ctrl) do
    client = Client.new(ENV['URL'],
                        ENV['CLIENT_ID'],
                        ENV['CLIENT_SECRET'])
    UsersController.new(client)
  end

  context '#new' do
    it 'does not throw exception' do
      expect { ctrl }.not_to raise_error
    end
  end

  context '#all' do
    it 'returns users array' do
      users = ctrl.all

      expect(users).to be_a(Array)
      expect(users[0]).to be_a(User)
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
