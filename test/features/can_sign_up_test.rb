require "test_helper"

class CanSignUpTest < Capybara::Rails::TestCase
  setup do
    User.create! name: "hellokitty", email: "kitty@hello.com", password: "12345678"
    Post.create! post_text: "meow meow meow", user_id: 1
  end

  test "can create a new account" do
    visit root_path
    click_link "Sign In"
    click_link "Sign Up"

    within("#new_user") do
      fill_in "Email", with: "newuser@example.com"
      fill_in "Password", with: "12345678"
      fill_in "Name", with: "Bob"
      click_button "Create User"
    end

    assert_content page, "Bob"
  end
  
end
