require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name:"Test User", email:"test@example.com",
  		password: "foobar", password_confirmation: "foobar")
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

  test "長すぎるname(50以上)はダメ" do
  	@user.name = "a"*51
  	assert_not @user.valid?
  end

  test "長すぎるemail(255以上)はダメ" do
  	@user.email = "a"*244 + "@example.com"
  	assert_not @user.valid?
  end

  test "emailアドレスは一意であるべき" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "passwordは空白ではいけない" do
  	@user.password = @user.password_confirmation = " "*6
  	assert_not @user.valid?
  end

  test "passwordは最低文字数を満たしてないといけない" do
  	@user.password = @user.password_confirmation = "a"*5
  	assert_not @user.valid?
  end
end
