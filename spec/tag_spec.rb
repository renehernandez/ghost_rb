# frozen_literal_string: true

require 'spec_helper'

RSpec.describe GhostRb::Resources::Tag do
  let(:tag) { GhostRb::Resources::Tag.new }

  context '#new' do
    it 'does not throw exception' do
      expect { tag }.not_to raise_error
    end
  end

  context '.generate' do
    it 'generates a tag with attributes already set' do
      new_tag = GhostRb::Resources::Tag.generate(id: 1, name: 'Getting Started')

      expect(new_tag.id).to eql(1)
      expect(new_tag.name).to eql('Getting Started')
    end

    it 'includes posts count' do
      counted_tag = GhostRb::Resources::Tag.generate(id: 1, name: 'With Posts Count',
                                                        count: {posts: 10})

      expect(counted_tag.posts_count).to eql(10)
    end
  end
end