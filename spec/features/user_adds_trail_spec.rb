require 'rails_helper'

feature "adding a trail" do
  scenario "user adds a trail with right information" do
    log_in_user

    visit new_trail_path

    fill_in 'Name', with: "Old Bridle Path"
    fill_in 'Park Name', with: "Franconia Notch"
    fill_in 'Latitude', with: 42.3601
    fill_in 'Longitude', with: 42.3601
    fill_in 'Distance', with: 2.9
    page.find('#date-hiked').set("02-01-2001")
    choose(5)
    check 'hiked'

    click_button "Add Trail"

    expect(page).to have_content "Old Bridle Path"
    expect(page).to have_content "Franconia Notch"
    expect(page).to have_content "42.3601"
    expect(page).to have_content "42.3601"
    expect(page).to have_content "2.9"
    expect(page).to have_content "5"
    expect(page).to have_content "true"

  end

  scenario "user edits a trail with right information" do
    log_in_user

    visit new_trail_path

    fill_in 'Name', with: "Old Bridle Path"
    fill_in 'Park Name', with: "Franconia Notch"
    fill_in 'Latitude', with: 42.3601
    fill_in 'Longitude', with: 42.3601
    fill_in 'Distance', with: 2.9
    page.find('#date-hiked').set("02-01-2001")
    choose(5)
    check 'hiked'

    click_button "Add Trail"

    expect(page).to have_content "Old Bridle Path"
    expect(page).to have_content "Franconia Notch"
    expect(page).to have_content "42.3601"
    expect(page).to have_content "42.3601"
    expect(page).to have_content "2.9"
    expect(page).to have_content "5"
    expect(page).to have_content "true"

    click_link "Edit Trail"

    fill_in 'Name', with: "Old Bridle Path"
    fill_in 'Park Name', with: "Franconia Notch"
    fill_in 'Latitude', with: 42.3601
    fill_in 'Longitude', with: 42.3601
    fill_in 'Distance', with: 2.9
    page.find('#date-hiked').set("02-01-2001")
    choose(5)
    check 'hiked'

    click_button "Add Trail"

    expect(page).to have_content "Old Bridle Path"
    expect(page).to have_content "Franconia Notch"
    expect(page).to have_content "42.3601"
    expect(page).to have_content "42.3601"
    expect(page).to have_content "2.9"
    expect(page).to have_content "5"
    expect(page).to have_content "true"
  end
end
