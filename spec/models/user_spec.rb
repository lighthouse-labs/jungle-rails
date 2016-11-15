require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it "shouldn't save if emails are same" do
      @user = User.create(first:"Andreas", last:"hardest", email:'something@something.com', password:'abcdefgh',password_confirmation:'abcdefgh')
      @user2 = User.create(first:"Andreas", last:"hardest", email:'somethinG@something.com', password:'abcdefgh',password_confirmation:'abcdefgh')
      expect(@user2.id).to be nil
    end
     it "shouldn't save if no password confirmation" do
      @user = User.create(first:"Andreas", last:"hardest", email:'something@something.com', password:'abcdefgh')
      @user2 = User.create(first:"Andreas", last:"hardest", email:'somethinG@something.com', password:'abcdefgh',password_confirmation:'abcdefgh')
      expect(@user.id).to be nil
    end
    it "shouldn't save if password confirmation doesn't match" do
      @user = User.create(first:"Andras",  last:"hardest",email:'something@something.com', password:'abcdefgh', password_confirmation:'heelo000')
      @user2 = User.create(first:"Andreas", last:"hardest", email:'somethins@something.com', password:'abcdefgh', password_confirmation:'abcdefgh')
      expect(@user.id).to be nil
      expect(@user2.id).to be_truthy
    end
    it "shouldn't save if password is less than 8 characters" do
      @user = User.create(first:"Andras",  last:"hardest",email:'something@something.com', password:'hello', password_confirmation:'hello')
      @user2 = User.create(first:"Andreas", last:"hardest", email:'somethins@something.com', password:'naw', password_confirmation:'naw')
      expect(@user.id).to be nil
      expect(@user2.id).to be nil
    end
    it { should have_secure_password }
    end



  context "authenticate with credenitials " do
    it "should log in if you put an existing email and password in" do
      @user = User.create(first:"Andras",  last:"hardest",email:'something@something.com', password:'hello000', password_confirmation:'hello000')
      expect(User.authenticate_with_credentials(@user.email,@user.password)).to be_present
    end
    it "Rejects incorrect login email" do
      @user = User.create(first:"Andras",  last:"hardest",email:'something@something.com', password:'hello000', password_confirmation:'hello000')
      expect(User.authenticate_with_credentials("notthe@rightemail.com" ,@user.password)).to be nil
    end
    it "Rejects incorrect login password" do
      @user = User.create(first:"Andras",  last:"hardest",email:'something@something.com', password:'hello000', password_confirmation:'hello000')
      expect(User.authenticate_with_credentials(@user.email ,"inncorrect")).to be nil
    end
    it "should log in if you put spaces before the email and password in" do
      @user = User.create(first:"Andras",  last:"hardest",email:'something@something.com', password:'hello000', password_confirmation:'hello000')
      expect(User.authenticate_with_credentials("   #{@user.email}",@user.password)).to be_present
    end
     it "should log in regardless of capitalization" do
      @user = User.create(first:"Andras",  last:"hardest",email:'something@something.com', password:'hello000', password_confirmation:'hello000')
      expect(User.authenticate_with_credentials('somEthiNg@sOmething.coM',@user.password)).to be_present
    end
  end
end
