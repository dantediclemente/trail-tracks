feature "user signs up" do
  scenario "user signs up successfully" do
    visit new_user_registration_path

    fill_in 'Email', with: "test@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
  scenario "user leaves blank fields" do
    visit new_user_registration_path

    click_button "Sign up"
  end
  scenario "user passwords don't match" do
    visit new_user_registration_path

    fill_in 'Email', with: "test@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password1"
    click_button "Sign up"
  end
end
