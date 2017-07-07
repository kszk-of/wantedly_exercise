require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  	@user.save
  	@skill = Skill.new(name: "TestName", user_id: @user.id)
  end

  test "skill有効性のチェック" do
  	assert @skill.valid?
  end

  test "user_idの存在性のチェック" do
  	@skill.user_id = nil
  	assert_not @skill.valid?
  end
end
