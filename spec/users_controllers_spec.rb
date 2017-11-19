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

end
