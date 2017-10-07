# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GhostRb::Controllers::BaseController, integration: true do
  let(:ctrl) do
    client = GhostRb::Client.new(ENV['URL'],
                          ENV['CLIENT_ID'],
                          ENV['CLIENT_SECRET'])
    GhostRb::Controllers::BaseController.new(client)
  end

  describe 'fluent' do
    context '#limit' do 
      it 'return same ctrl instance' do
        limited_ctrl = ctrl.limit('all')

        expect(limited_ctrl).to eql(ctrl)
      end
    end

    context '#include' do 
      it 'returns same ctrl instance' do
        included_ctrl = ctrl.include('hello')

        expect(included_ctrl).to eql(ctrl)
      end
    end
  end
end