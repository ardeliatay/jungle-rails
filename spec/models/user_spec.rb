require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'is valid with all proper data' do
      user1 = User.create(name: 'a b', email: 'test@example.com', password:'test', password_confirmation: 'test')
      expect(user1).to be_valid
    end

    it 'is invalid without a name' do
      user1 = User.create(name: nil, email: 'test@example.com', password:'test', password_confirmation: 'test')
      expect(user1).to_not be_valid
      expect(user1.errors.messages[:name]).to include('can\'t be blank')
    end

    it 'is invalid without a password' do
      user1 = User.create(name: 'abc', email: 'test@example.com', password: nil, password_confirmation: 'test')
      expect(user1).to_not be_valid
      expect(user1.errors.messages[:name]).to include('can\'t be blank')
    end

    it 'is invalid if password and password confirmation do not match' do
    end 
    
    it 'is invalid if password is too short' do
    end

    it 'is invalid without an email' do
    end

    it 'is invalid without a unique email' do
    end


end









  
  









 

  context 'on an existing user' do
    let(:user) do
      full_user1 = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      full_user1.save
      User.find full_user1.id
    end

    it "should be valid with no changes" do
      expect(user).to_not be_valid
    end

    it "should not be valid with an empty password" do
      user.password = user.password_confirmation = ""
      expect(user).to_not be_valid
    end

    it "should be valid with a new (valid) password" do
      user.password = user.password_confirmation = "new password"
      expect(user).to be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    
    it 'should authenticate if password and email are valid' do
    user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
    user.save
    valid_user = User.authenticate_with_credentials('email@email.com', 'apples')

    expect(valid_user).to eq(user)
    end

    it 'should not authenticate if password and email are valid' do
      user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      user.save
      invalid_user = User.authenticate_with_credentials('notemail@notemail.com', 'apples')
  
      expect(invalid_user).to_not eq(user)
    end

    it 'should authenticate if user adds uppercase letters to their email' do
      user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      user.save
      valid_user = User.authenticate_with_credentials('EMAIL@email.com', 'apples')
      expect(valid_user).to eq(user)
    end

    it 'should authenticate if user adds spaces to beginning or end of email' do
      user = User.new(first_name: 'a', last_name: 'b', email: 'email@email.com', password: 'apples', password_confirmation: 'apples')
      user.save
      valid_user = User.authenticate_with_credentials(' email@email.com ', 'apples')
      expect(valid_user).to eq(user)
    end
  end
end
