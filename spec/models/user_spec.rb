require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "doesn't save if first name is missing" do
      user = User.new({
        first_name: nil,
        last_name: "Jones",
        email: "wow@wow.com",
        password: "p@ssword",
        password_confirmation: "p@ssword"
        })
      expect(user.save).to be(false)
    end

    it "doesn't save if last name is missing" do
      user = User.new({
        first_name: "Bob",
        last_name: nil,
        email: "bow@wow.com",
        password: "p@ssword",
        password_confirmation: "p@ssword"
        })
      expect(user.save).to be(false)
    end

    it "doesn't save if email is missing" do
      user = User.new({
        first_name: "Bob",
        last_name: "Dole",
        email: nil,
        password: "p@ssword",
        password_confirmation: "p@ssword"
        })
      expect(user.save).to be(false)
    end

    it "doesn't save if password is missing" do
      user = User.new({
        first_name: "Bob",
        last_name: "Green",
        email: "wow@bow.com",
        password: nil,
        password_confirmation: "p@ssword"
        })
      expect(user.save).to be(false)
    end

    it "doesn't save if password and password confirmation don't match" do
      user = User.new({
        first_name: "Bob",
        last_name: nil,
        email: "wow@wow.com",
        password: "p@ssword",
        password_confirmation: "NotAp@ssword"
        })
      expect(user.save).to be(false)
    end

    it "doesn't save if email isn't unique" do
      user1 = User.new({
        first_name: "Bob",
        last_name: "Dumbo",
        email: "wow@wow.com",
        password: "p@ssword",
        password_confirmation: "p@ssword"
        })
      user1.save
      user2 = User.new({
        first_name: "Bob",
        last_name: "White",
        email: "WOW@wOw.com",
        password: "p@ssword",
        password_confirmation: "p@ssword"
        })
      expect(user2.save).to be(false)
    end

    it "requires password to be minimum length 5" do
      user = User.new({
        first_name: "Jim",
        last_name: "Bob",
        email: "sloopy@sleepy.ca",
        password: "hi",
        password_confirmation: "hi"
        })
      expect(user.save).to be(false)
    end
  end

  describe ".authenticate_with_credentials" do

    it "returns nil if given wrong password" do
      user = User.new({
        first_name: "Jim",
        last_name: "Bob",
        email: "sloopy@sleepy.ca",
        password: "hihowdy",
        password_confirmation: "hihowdy"
        })
      user.save
      @user = User.authenticate_with_credentials("sloopy@sleepy.ca", "lolbye")
      expect(@user).to be nil
    end

    it "returns nil if given wrong email" do
      user = User.new({
        first_name: "Jim",
        last_name: "Bob",
        email: "sloopy@sleepy.ca",
        password: "hihowdy",
        password_confirmation: "hihowdy"
        })
      user.save
      @user = User.authenticate_with_credentials("sloopy@sloopy.ca", "hihowdy")
      expect(@user).to be nil
    end

    it "returns user if given correct email / password" do
      user = User.new({
        first_name: "Jim",
        last_name: "Bob",
        email: "test@test.ca",
        password: "hihowdy",
        password_confirmation: "hihowdy"
        })
      user.save
      @user = User.authenticate_with_credentials("test@test.ca", "hihowdy")
      expect(@user).to eql user
    end

    it "returns user even if email has extra whitespace" do
      user = User.new({
        first_name: "Jim",
        last_name: "Bob",
        email: "test@test.ca",
        password: "hihowdy",
        password_confirmation: "hihowdy"
        })
      user.save
      @user = User.authenticate_with_credentials("    test@test.ca    ", "hihowdy")
      expect(@user).to eql user
    end

    it "returns user ignoring email case sensitivity" do
      user = User.new({
        first_name: "Jim",
        last_name: "Bob",
        email: "test@test.ca",
        password: "hihowdy",
        password_confirmation: "hihowdy"
        })
      user.save
      @user = User.authenticate_with_credentials("tEST@Test.CA", "hihowdy")
      expect(@user).to eql user
    end
  end
end
