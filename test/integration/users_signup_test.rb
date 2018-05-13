require 'test_helper'
require 'faker'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'Invalid Signup Information' do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: '', email: 'user@invalid', password: 'foo', password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert', { text: "The form contains 4 errors." }
    assert_select 'div.alert-danger'
    assert_select 'div.field_with_errors' , 8
  end
  
  test 'Valid Signup Information' do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { name: Faker::Name.name, email: Faker::Internet.email,
                                          password: 'foozeball', password_confirmation: 'foozeball' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
    assert_not flash.empty?
  end
end
