# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GhostRb::Support::HashWithIndifferentAccess do
  HashWithIndifferentAccess = GhostRb::Support::HashWithIndifferentAccess
  let(:empty_hash) { HashWithIndifferentAccess.new }

  let(:loaded_hash) do 
    HashWithIndifferentAccess.new({
      foo: 'Foo',
      'bar' => 'Bar'
    })
  end

  context '#new' do
    it 'does not throw exception' do
      expect { empty_hash }.not_to raise_error
    end

    it 'copy elements from input hash' do
      hash_with_input = HashWithIndifferentAccess.new({
          'hello' => 1,
          world: 2
      })

      expect(hash_with_input['hello']).to eql(1)
      expect(hash_with_input[:world]).to eql(2)
    end
  end
  
  context '#[]' do
    it 'key as string or symbol returns same value' do
      expect(loaded_hash['foo']).to eql('Foo')
      expect(loaded_hash[:foo]).to eql('Foo')
    end
  end

  context '#[]=' do
    it 'makes hash value to be indifferent access' do
      empty_hash[:sub_hash] = { one: 'one' }
      
      expect(empty_hash['sub_hash']).to be_a(HashWithIndifferentAccess)
    end

    it 'match string key with symbol' do
      expect(loaded_hash['foo']).to eql('Foo')
    end
  end

  context '#key?' do
    it 'match symbol key with string' do
      expect(loaded_hash[:bar]).to eql('Bar')
    end

    it 'match string key with symbol' do
      expect(loaded_hash['foo']).to eql('Foo')
    end
  end
end
