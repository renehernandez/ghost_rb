# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GhostRb::Controllers::BaseController do
  let(:ctrl) do
    obj = GhostRb::Controllers::BaseController.new(nil)
    obj.define_singleton_method(:endpoint) { 'tests' }
    obj
  end

  describe 'fluent' do
    context '#limit' do
      it 'return new ctrl instance' do
        limited_ctrl = ctrl.limit('all')

        expect(limited_ctrl).not_to eql(ctrl)
      end
    end

    context '#include' do
      it 'returns new ctrl instance' do
        included_ctrl = ctrl.include('hello')

        expect(included_ctrl).not_to eql(ctrl)
      end
    end

    context '#page' do
      it 'returns new ctrl instance' do
        paged_ctrl = ctrl.page(2)

        expect(paged_ctrl).not_to eql(ctrl)
      end
    end

    context '#order' do
      it 'returns new ctrl instance' do
        ordered_ctrl = ctrl.order('created_at')

        expect(ordered_ctrl).not_to eql(ctrl)
      end
    end

    context '#fields' do
      it 'returns new ctrl instance' do
        fielded_ctrl = ctrl.fields(2)

        expect(fielded_ctrl).not_to eql(ctrl)
      end
    end

    context '#where' do
      it 'returns new ctrl instance' do
        where_ctrl = ctrl.where(include: 'author')

        expect(where_ctrl).not_to eql(ctrl)
      end
    end

    context '#find_by' do
      it 'throws GhostRb::Errors::RequestError with invalid key_value' do
        expect { ctrl.find_by(data: 'hello') }.to raise_error(GhostRb::Errors::InvalidEndpointError)
      end
    end
  end
end
