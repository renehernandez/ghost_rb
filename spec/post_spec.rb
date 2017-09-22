# frozen_literal_string: true

require 'spec_helper'

RSpec.describe GhostRb::Resources::Post do
  let(:post) { GhostRb::Resources::Post.new }

  context '#new' do
    it 'do not throw exception' do
      expect { post }.not_to raise_error
    end
  end

  context '.generate' do
    it 'generates a post with attributes already set' do
      test_post = GhostRb::Resources::Post.generate({id: 1, title: 'Generated'})

      expect(test_post.id).to eql(1)
      expect(test_post.title).to eql('Generated')
    end

  end

end