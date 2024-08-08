# spec/features/creating_and_deleting_entries_spec.rb

require 'rails_helper'

RSpec.feature "Creating and Deleting Entries", type: :feature, js: true do
  scenario "User creates a journal entry and then deletes it" do
    # Step 1: Create a new journal entry

    # Visit the new journal entry page
    visit new_journal_path

    # Fill in the journal entry form
    fill_in 'Name', with: 'John Doe'
    fill_in 'Journal Info', with: 'Today was a productive day with many achievements.'
    fill_in 'Trainings Done', with: 'Completed the Ruby on Rails course.'
    fill_in 'Internal Work Done', with: 'Reviewed internal project documentation.'

    # Adjust the slider value if necessary
    find('input[type="range"]').set(7) # Example value, adjust if necessary

    # Submit the form
    click_button 'Create Journal'

    # Confirm successful creation
    expect(page).to have_content('John Doe') # Adjust this message based on your app's flash message

    # Step 2: Delete the created journal entry

    # Visit the journal entries index page
    visit journals_path

    # Find and click the link to view the newly created journal entry
    entry = Journal.last # Retrieve the most recently created entry
    expect(page).to have_link('Show', href: journal_path(entry))

    click_link 'Show'

    # Handle the confirmation alert when deleting the entry
    accept_confirm do
      click_button 'Delete' # Ensure this matches the actual link or button text
    end


    # Verify that the deleted entry is no longer visible
    expect(page).not_to have_content('John Doe')
  end
end


