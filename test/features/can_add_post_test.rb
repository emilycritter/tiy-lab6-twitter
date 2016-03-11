require "test_helper"

class CanAddPostTest < Capybara::Rails::TestCase
  setup do
    User.create! name: "hellokitty", email: "kitty@hello.com", password: "12345678"
    Post.create! post_text: "meow meow meow", user_id: 1
  end

  test "can add a post" do
    visit root_path
    click_link "Sign In"

    fill_in "Email", with: "kitty@hello.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    page.first("#new-post").click

    within("#new_post") do
      fill_in "Post", with: "new meows. all the meows"
      attach_file('Photo', "#{Rails.root}/test/fixtures/kitty.jpg")
      click_button "Create Post"
    end

    assert_content "new meows. all the meows"
  end

end
