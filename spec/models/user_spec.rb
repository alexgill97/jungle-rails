require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
    it "saves succesfully if all fields are valid" do
      user_params = { first_name: "Pineapple", last_name: "Pizza", email: "pineapple@pizza.com", password: "123456789", password_confirmation: "123456789" }
      @user = User.new(user_params)

      expect(@user.save).to be true
    end

    it "should not create new user when password and password_confirmation don't match" do
      user_params = { first_name: "Captain", last_name: "Picard", email: "uss_enterprise@starfleet.com", password: "123456789", password_confirmation: "987654321" }
      @user = User.new(user_params)

      expect(@user.save).to be false
    end

    it "should not create user when password length is too short" do
      user_params = { first_name: "William", last_name: "Riker", email: "wt.riker@starfleet.com", password: "1234567", password_confirmation: "1234567" }
      @user = User.new(user_params)

      expect(@user.save).to be false
    end

    describe '.authenticate_with_credentials' do
      it "should return a user if email and password are correct" do
        user_params = { first_name: "Commander", last_name: "Data", email: "data@starfleet.com", password: "12345678", password_confirmation: "12345678" }
        @user = User.new(user_params)
        @user.save
  
        expect(User.authenticate_with_credentials("data@starfleet.com", "12345678").class).to be User
      end
 
      it "should return nil if email is incorrect" do
        user_params = { first_name: "Geordi", last_name: "LaForge", email: "g.laforge@starfleet.com", password: "12345678", password_confirmation: "12345678" }
        @user = User.new(user_params)
        @user.save
  
        expect(User.authenticate_with_credentials("glaforge@starfleet.com", "12345678")).to be nil
      end
  
      it "should return nil if password is incorrect" do
        user_params = { first_name: "Beverly", last_name: "Crusher", email: "b.crusher@starfleetmedical.com", password: "12345678", password_confirmation: "12345678" }
        @user = User.new(user_params)
        @user.save
  
        expect(User.authenticate_with_credentials("b.crusher@starfleetmedical.com", "87654321")).to be nil
      end
    end
  end
end