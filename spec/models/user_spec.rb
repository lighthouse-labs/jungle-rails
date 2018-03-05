require 'rails_helper'

RSpec.describe User, type: :model do
    context "Validations" do

    it "User fields will save successfully" do
        @user = User.new(
            name: "abc123",
            email: "abc123@gmail.com",
            password: "123456",
            password_confirmation: "123456"
          )
      

    expect(@user.name).to eq("abc123")
    expect(@user.email).to eq("abc123@gmail.com")
    expect(@user.password).to eq("123456")
    expect(@user.password_confirmation).to eq("123456")
    end

    it "User name not valid" do
        @user = User.new(
            name: nil,
            email: "abc123@gmail.com",
            password: "123456",
            password_confirmation: "123456"
        )

    expect(@user).to_not be_valid
    end


    it "User email not valid" do
        @user = User.new(
            name: 'abc123',
            email: nil,
            password: "123456",
            password_confirmation: "123456"
        )

    expect(@user).to_not be_valid
    end

    it "User first password not inserted" do
        @user = User.new(
            name: 'abc123',
            email: "abc123@gmail.com",
            password: nil,
            password_confirmation: "123456"
        )

    expect(@user).to_not be_valid
    end

    it "User password didn't match" do
        @user = User.new(
            name: 'abc123',
            email: "abc123@gmail.com",
            password: "123456",
            password_confirmation: "654321"
    )

    expect(@user).to_not be_valid
    end
    
    it "Repeated email on database" do
        @user = User.new(
            name: 'abc123',
            email: "tjbeirao@gmail.com",
            password: "123456",
            password_confirmation: "654321"
    )

    expect(@user).to_not be_valid
    end

    it "User password less than 6 characteres" do
        @user = User.new(
            name: 'abc123',
            email: "abc123@gmail.com",
            password: "123",
            password_confirmation: "123"
    )

    expect(@user).to_not be_valid
    end


    end
end