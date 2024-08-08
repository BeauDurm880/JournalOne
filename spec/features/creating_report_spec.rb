# spec/features/generating_reports_spec.rb

require 'rails_helper'

RSpec.feature "Generating Reports", type: :feature do
  scenario "User navigates to the day rating report page, fills out the date range, and generates a PDF report" do
    # Visit the day rating report page
    visit reports_day_rating_path

    # Fill out the date range form
    fill_in 'Start Date', with: '2024-01-01'  # Use the actual start date
    fill_in 'End Date', with: '2024-01-31'    # Use the actual end date

    # Click the 'Filter' button
    click_button 'Filter'

    # Click the 'Generate Report' link
    # Ensure to use the correct path or text for the link if it's different
    click_link 'Generate Report'

    # Expect to see the PDF file download or a successful action message
    # Note: Capybara does not handle file downloads directly, so you'll often check
    # the page for confirmation that the report was generated.
    # You might need to check the PDF generation path if applicable.
    expect(page).to have_content('Happiness Ratings Over Selected Period')  # Verify content after generating the report
    # Optionally verify specific content on the page or download behavior
    # Example: expect(page).to have_content('Some expected content')
  end
end

