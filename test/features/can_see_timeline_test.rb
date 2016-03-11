require "test_helper"

class CanSeeTimelineTest < Capybara::Rails::TestCase
  setup do
    User.create! name: "hellokitty", email: "kitty@hello.com", password: "12345678"
    Post.create! post_text: "meow meow meow", user_id: 1
  end

  test "can see timeline at root" do
    visit root_path
    assert_content "meow meow meow"
  end

end
