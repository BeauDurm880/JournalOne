require 'rails_helper'

RSpec.feature "Creating Entries", type: :feature do
  scenario "User fills out the journal entry form and submits" do
   
    visit new_journal_path

    fill_in 'Name', with: 'John Doe'
    fill_in 'Journal Info', with: 'Today was a productive day with many achievements.'
    fill_in 'Trainings Done', with: 'Completed the Ruby on Rails course.'
    fill_in 'Internal Work Done', with: 'Reviewed internal project documentation.'
    
    
    script = <<-JS
      document.querySelector('input[type="range"]').value = 8;
      document.querySelector('input[type="range"]').dispatchEvent(new Event('input')); 
    JS
    page.execute_script(script)

    click_button 'Create Journal' 

    
   
    expect(page).to have_content('John Doe')
    
  end
end

