require 'spec_helper'

feature 'create new inquiry' do
  after(:all) { Inquiry.destroy_all }
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

  scenario 'user sees inquiries' do
    new_inquiry = FactoryGirl.create(:inquiry)
    visit '/'
    expect(page).to have_content(new_inquiry.first_name)
    expect(page).to have_content(new_inquiry.last_name)
    expect(page).to have_content(new_inquiry.email)
    expect(page).to have_content(new_inquiry.subject)
  end

  scenario 'admin sees description when clicking on subject' do
    new_inquiry = FactoryGirl.create(:inquiry)
    visit '/'
    click_link new_inquiry.subject
    expect(page).to have_content(new_inquiry.description)
    expect(page).to have_content(new_inquiry.subject)
  end

  scenario 'admin deletes an inquiry' do
    new_inquiry = FactoryGirl.create(:inquiry)
    visit inquiry_path(new_inquiry)
    click_on 'Destroy Story'
    expect(page).to have_content('Story deleted successfully')
    expect(page).to_not have_content(new_inquiry.subject)
  end

  scenario "user can't create inquiry without all required fields" do
    visit '/'
    click_on 'Contact Us'
    click_on 'Submit Inquiry'
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Subject can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
