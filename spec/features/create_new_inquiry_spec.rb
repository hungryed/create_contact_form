require 'spec_helper'

feature 'create new inquiry' do
  scenario 'user can create inquiry' do
    visit '/'
    click_on 'Contact Us'
    fill_in 'First name', with: "Unoriginal"
    fill_in "Last name", with: "Name"
    fill_in "Email", with: "unoriginal@name.com"
    fill_in "Subject", with: 'No User Sign Up'
    fill_in "Description", with: "Subject says it all"
    click_on 'Submit Inquiry'
    expect(page).to have_content('Inquiry created successfully')
  end
end
