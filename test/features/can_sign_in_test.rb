require "test_helper"

class CanSignInTest < Capybara::Rails::TestCase
  setup do
    User.create! name: "hellokitty", email: "kitty@hello.com", password: "12345678"
    Post.create! post_text: "meow meow meow", user_id: 1
  end

  test "can sign in" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: "kitty@hello.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "hellokitty"
  end

  test "can press 'Sign In' on sign in without fields" do
    visit root_path
    click_link "Sign In"
    assert_content page, "Sign In"
  end

  test "Can signin with all caps email" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: "KITTY@HELLO.COM"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "hellokitty"
  end
end
