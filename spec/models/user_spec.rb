require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'is valid with all proper data' do
      user = User.create(name: 'Dia', email: 'dia@example.com', password:'test', password_confirmation: 'test')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.create(name: nil, email: 'dia@example.com', password:'test', password_confirmation: 'test')
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user = User.create(name: 'Dia', email: 'dia@example.com', password: nil, password_confirmation: 'test')
      expect(user1).to_not be_valid
    end

    it 'is invalid if password and password confirmation do not match' do
      password = User.create(name:'Dia', email: 'dia@example.com', password:'test', password: 'tests')
      expect(password).to_not be_equal(password.password_confirmation)
    end 
    
    it 'is invalid if password is too short' do
      user = User.create(name:'Dia', email: 'dia@example.com', password:'t', password: 't')
      expect(user).to_not be_valid
    end

    it 'is invalid without a unique email' do
      @user = User.create(name:'Dia', email: 'dia@example.com', password_digest: 'dia')
      @user1 = User.create(name:'Dia', email: 'dia@EXAMPLE.com', password_digest: 'dia')
      expect(@user1).to_not be_valid
    end

end

  describe '.authenticate_with_credentials' do
    it 'should login when the user credentials are valid' do
    user = User.create(name:'Dia', email: 'ardeliatay@gmail.com', password:'test', password: 'test')
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not be_valid
    end
  end
end













  
  









 

  