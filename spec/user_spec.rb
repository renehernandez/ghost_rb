# frozen_literal_string: true

require 'spec_helper'

RSpec.describe GhostRb::Resources::User do
  let(:user) { GhostRb::Resources::User.new }

  context '#new' do
    it 'does not throw exception' do
      expect { user }.not_to raise_error
    end
  end

  context '.generate' do
    it 'generates a user with attributes already set' do
      new_user = GhostRb::Resources::User.generate(id: 1, name: 'Rene')

      expect(new_user.id).to eql(1)
      expect(new_user.name).to eql('Rene')
    end

    it 'includes posts count' do
      counted_user = GhostRb::Resources::User.generate(id: 1, name: 'Rene',
                                                        count: {posts: 5})

      expect(counted_user.posts_count).to eql(5)
    end
  end
end