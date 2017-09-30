# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GhostRb::Resources::Hydratable do
  let(:object) do
    obj = Class.new do
      include GhostRb::Resources::Hydratable

      attr_accessor :foo
      attr_reader :bar

      def initialize
        @foo = 5
        @bar = 3
      end
    end.new
    obj
  end

  context '#hydrate' do
    it 'updates writable attributes' do
      hash = { foo: 10 }
      object.hydrate(hash)

      expect(object.foo).to eql(10)
    end

    it "doesn't change readable attributes" do
      hash = { bar: 5 }
      object.hydrate(hash)

      expect(object.bar).to eql(3)
    end
  end
end
