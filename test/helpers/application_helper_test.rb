require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "full title helper" do
    assert_equal full_title, @base_title
    assert_equal full_title("Help"), "Help | #{@base_title}"
    assert_equal full_title("About"), "About | #{@base_title}"
    assert_equal full_title("Contact"), "Contact | #{@base_title}"
    assert_equal full_title("Sign up"), "Sign up | #{@base_title}"
  end
end