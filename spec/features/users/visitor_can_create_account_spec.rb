require 'rails_helper'

feature "visitor can create account" do
  scenario "from login page" do
    visit '/'

    click_on "Login"

    click_on "Sign Up For An Account"

    fill_in "user[username]", with: "Charlie"
    fill_in "user[name]", with: "Chuck"
    fill_in "user[email]", with: "charlie@charlie.com"
    fill_in "user[phone]", with: "5555555555"
    fill_in "user[password]", with: "I love the waitress"
    fill_in "user[password_confirmation]", with: "I love the waitress"

    click_on "Create Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as: Charlie")
    expect(page).to_not have_link("Log In")
    expect(page).to have_link("Logout")
  end
  scenario "user creates an invalid account and is redirected to the create page" do
    visit '/'

    click_on "Login"

    click_on "Sign Up For An Account"

    fill_in "user[username]", with: ""
    fill_in "user[password]", with: ""
    fill_in "user[password_confirmation]", with: "dd"

    click_on "Create Account"

    expect(current_path).to_not eq(dashboard_path)
  end
end
