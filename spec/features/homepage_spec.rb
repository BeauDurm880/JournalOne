# spec/features/homepage_spec.rb

require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User visits the homepage" do
    visit root_path
    expect(page).to have_content("Entries")
  end
end
