require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
	  @user = User.new(username: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	end

	test "should be valid" do
	  assert @user.valid?
	end

	test "name should be present" do
    @user.username = "     "
    assert_not @user.valid?
	end
end
