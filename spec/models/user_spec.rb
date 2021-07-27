require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.new(
        first_name: "John",
        last_name: "Doe",
        email: "w@w.com", 
        password: "12345",
        password_confirmation: "12345"
      )
    end

    it "is valid with valid attributes" do
      expect(@user.save).to eq true
      expect(@user).to be_valid
    end

    it "is not valid without a first name" do
      @user.first_name = nil
      # puts @user.errors.full_messages
      expect(@user.save).to eq false
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user.save).to eq false
      expect(@user).to_not be_valid
    end

    it "is not valid without a unique email address" do
      @user2 = User.create(
        first_name: "Jane",
        last_name: "Doe",
        email: "a@a.com", 
        password: "12345",
        password_confirmation: "12345"
      )
      @user3 = User.create(
        first_name: "Jane",
        last_name: "Doe",
        email: "A@A.com", 
        password: "12345",
        password_confirmation: "12345"
      )
      expect(@user2.save).to eq false
      expect(@user3.save).to eq false
      expect(@user2).to_not be_valid
      expect(@user3).to_not be_valid
    end

    it "is not valid when password confirmation does not match with password" do
      @user4 = User.create(
        first_name: "Jane",
        last_name: "Doe",
        email: "b@b.com", 
        password: "12345",
        password_confirmation: "12344"
      )
      expect(@user4.save).to eq false
      expect(@user4).to_not be_valid
    end

    it "is not valid when password length is less than 5 characters" do
      @user5 = User.create(
        first_name: "Jane",
        last_name: "Doe",
        email: "b@b.com", 
        password: "123",
        password_confirmation: "123"
      )
      expect(@user5.save).to eq false
      expect(@user5).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before :each do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "w@w.com", 
        password: "12345",
        password_confirmation: "12345"
      )
    end

    it "is valid with a matching email and password" do
      @user2 = User.authenticate_with_credentials( "w@w.com", "12345" )
      expect(@user2).not_to be_nil
    end

    it "is valid with white space in front or back of the email address" do
      @user3 = User.authenticate_with_credentials( "  w@w.com  ", "12345" )
      expect(@user3).not_to be_nil
    end

    it "is valid with upper/lower case on the email address" do
      @user4 = User.authenticate_with_credentials( "W@w.CoM", "12345" )
      expect(@user4).not_to be_nil
    end

    it "is not valid with a not matching email and password" do
      @user5 = User.authenticate_with_credentials( "a@w.com", "12345" )
      @user6 = User.authenticate_with_credentials( "w@w.com", "12344" )
      expect(@user5).to be_nil
      expect(@user6).to be_nil
    end

    it "is not valid when email or password is blank" do
      @user7 = User.authenticate_with_credentials( "", "12345" )
      @user8 = User.authenticate_with_credentials( "w@w.com", "" )
      expect(@user7).to be_nil
      expect(@user8).to be_nil
    end
  end

end
