require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
      @user_db = User.create!({name: "test", email: "tEst@TEST", password: "12345667"})
      @user_doppel = User.new({name: "test", email: "test@test", password: "12345667"})
      @user_pass = User.new({name: "test", email: "test2@test", password: "1234"})
  end
  it "if user already exists, same user should create error" do
    @user_doppel.save
    expect(@user_doppel.errors.full_messages).to_not be_nil
  end

  it "if password is shorter than 6 characters, an error should be created" do
    @user_pass.save
    expect(@user_pass.errors.full_messages).to_not be_nil
  end


  describe '.authenticate_with_credentials' do
    it "user logs in should be authenticated" do
      expect(User.authenticate_with_credentials("tEst@TEST", "12345667")).to_not be_nil
    end
  end

end
