# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Post do
  let(:post) { Post.new }

  context '#new' do
    it 'does not throw exception' do
      expect { post }.not_to raise_error
    end
  end

  context '#featured?' do
    it 'returns same value of accessor field' do
      post.featured = true

      expect(post.featured?).to eql(true)
    end
  end

  context '#page?' do
    it 'returns same value of accessor field' do
      post.page = false

      expect(post.page?).to eql(false)
    end
  end

  context '.generate' do
    it 'generates a post with attributes already set' do
      test_post = Post.generate(id: 1,
                                title: 'Generated')

      expect(test_post.id).to eql(1)
      expect(test_post.title).to eql('Generated')
    end

    it 'includes an author' do
      authored_post = Post.generate(id: 1,
                                    title: 'Authored',
                                    author: { name: 'Rene',
                                              status: 'active' })

      expect(authored_post.author).not_to be_nil
      expect(authored_post.author.name).to eql('Rene')
    end

    it 'includes tags list' do
      tagged_post = Post.generate(id: 1,
                                  title: 'Authored',
                                  tags: [
                                    { name: 'blue', visibility: 'public' },
                                    { name: 'green', visibility: 'private' }
                                  ])

      expect(tagged_post.tags.size).to eql(2)
      expect(tagged_post.tags[0].name).to eql('blue')
      expect(tagged_post.tags[1].visibility).to eql('private')
    end
  end
end
