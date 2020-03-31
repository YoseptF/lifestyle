require 'rails_helper'

RSpec.feature 'IndexIntegrations', type: :feature do
  it 'loads login and index if not logged in' do
    visit root_path
    expect(page).to have_link 'Log In'
  end
end
