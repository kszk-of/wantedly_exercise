require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name:"Test User", email:"test@example.com")
  end

  test "userインスタンスの有効性" do
  	assert @user.valid?
  end

  test "nameの存在性" do
  	@user.name = ""
  	assert_not @user.valid?
  end

  test "emailの存在性" do
  	@user.email = "     "
  	assert_not @user.valid?
  end
end
