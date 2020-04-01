require 'rails_helper'
require 'open-uri'

RSpec.feature 'VoteArticles', type: :feature do
  before do
    create_base_page
    visit category_path(id: 1)
  end
  describe 'before logging in' do
    it "doesn't show upvote button" do
      expect(page).to have_selector '.votes i', count: 1
    end
  end
  describe 'after logging in' do
    before do
      log_in_process
      visit category_path(id: 1)
    end
    it 'shows the downvote button' do
      expect(page).to have_selector 'i.fa-arrow-down', count: 1
    end
    it 'changes to upvote after downvoting' do
      click_link '', href: '/articles/1/votes/1'
      expect(page).to have_selector 'i.fa-arrow-up', count: 1
    end
    it 'changes again after upvoting' do
      click_link '', href: '/articles/1/votes/1'
      click_link '', href: '/articles/1/votes'
      expect(page).to have_selector 'i.fa-arrow-down', count: 1
    end
  end
end
