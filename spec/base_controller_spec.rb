# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GhostRb::Controllers::BaseController do
  let(:ctrl) { GhostRb::Controllers::BaseController.new(nil) }

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

    context '#page' do 
      it 'returns same ctrl instance' do
        paged_ctrl = ctrl.page(2)

        expect(paged_ctrl).to eql(ctrl)
      end
    end

    context '#order' do 
      it 'returns same ctrl instance' do
        ordered_ctrl = ctrl.order('created_at')

        expect(ordered_ctrl).to eql(ctrl)
      end
    end

    context '#fields' do 
      it 'returns same ctrl instance' do
        fielded_ctrl = ctrl.fields(2)

        expect(fielded_ctrl).to eql(ctrl)
      end
    end

    context '#where' do 
      it 'returns same ctrl instance' do
        where_ctrl = ctrl.where(include: 'author')

        expect(where_ctrl).to eql(ctrl)
      end
    end
  end
end