require 'rails_helper'
require 'open-uri'

RSpec.feature 'IndexIntegrations', type: :feature do
  before do
    create_base_page
  end
  describe 'if not logged in' do
    it 'loads login link' do
      expect(page).to have_link 'LOGIN'
    end
    it 'loads register link' do
      expect(page).to have_link 'REGISTER'
    end
  end
  describe 'after logging in' do
    before do
      log_in_process
    end
    it 'loads publish button' do
      expect(page).to have_link 'PUBLISH'
    end
    it 'loads LOG OUT button' do
      expect(page).to have_link 'LOG OUT'
    end
    it 'loads welcome message button' do
      expect(page).to have_selector '.access span', text: "Hello!, #{User.first.name}"
    end
  end
end
