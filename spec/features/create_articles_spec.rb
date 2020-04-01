require 'rails_helper'
require 'open-uri'

RSpec.feature 'CreateArticles', type: :feature do
  before do
    create_base_page
    log_in_process
    click_link 'PUBLISH'
  end
  describe 'fails when' do
    check_for_empty_fields

    check_for_short_fields

    check_for_long_fields
  end
  it 'saves with the correct data' do
    fill_in 'article_title', with: 'article from test'
    fill_in 'article_text', with: '1' * 30_000
    attach_file 'Image', 'spec/images/test.jpg'
    click_button 'commit'
    expect(Article.last.title).to eq('article from test')
  end
end
