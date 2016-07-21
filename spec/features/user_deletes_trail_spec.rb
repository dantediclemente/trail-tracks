require 'rails_helper'

feature "deleting a trail" do
  scenario "user deletes a trail" do
    log_in_user

    visit new_trail_path

    fill_in 'Name', with: "Old Bridle Path"
    fill_in 'Park Name', with: "Franconia Notch"
    fill_in 'Latitude', with: 42.3601
    fill_in 'Longitude', with: 42.3601
    fill_in 'Distance', with: 2.9
    page.find('#date-hiked').set("02-01-2001")
    select(5, from: 'Rating')
    check 'hiked'

    click_button "Add Trail"

    click_link "Delete Trail"

    expect(page).to have_content("Trail deleted successfully")
  end
end
