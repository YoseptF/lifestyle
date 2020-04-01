require 'rails_helper'
require 'open-uri'

RSpec.describe Article, type: :model do
  let(:article1) { Article.new }
  let(:user1) { User.new(name: 'Joseph') }
  context 'The article needs' do
    describe 'a title' do
      title_validations
    end
    describe 'a text' do
      text_validations
    end
    it 'an image attached' do
      article1.save
      expect(article1.errors.full_messages).to include("Image can't be blank")
    end
    it 'an existing user' do
      article1.save
      expect(article1.errors.full_messages).to include('Author must exist')
    end
  end
  it 'saves with the correct data' do
    valid_article
    article1.save
    expect(Article.last).to eq article1
  end
  it 'can add a category' do
    valid_article
    article1.save
    article1.categories << Category.find_or_create_by(name: 'Games', priority: 1)
    expect(Article.last.categories).to include(Category.find_by(name: 'Games'))
  end
end
