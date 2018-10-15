require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.create(name: 'Jone Doe', email: 'jonedoe@gmail.com',
      password:'123456', password_confirmation: '123456')
    }
    
    describe 'Validations' do

      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
    
      # validate fields cannot be empty
      it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a email" do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a password" do
        subject.password = nil
        expect(subject).to_not be_valid
      end

      # validate matching password
      it "is not valid without a matching password" do
        user1 = User.create(name: 'James', email: 'james@gmail.com', password: 'james123', password_confirmation: 'jam123')
        expect(user1).to_not be_valid
      end

      # validate unique email
      it "is not valid without an unique email" do
        User.create(name: 'Jone Doe', email: 'jonedoe@gmail.com', password: '123456', password_confirmation: '123456') 
        user1 = User.new(name: 'Jone Doe', email: 'JONEDOE@gmail.com', password: '123456', password_confirmation: '123456')      
        expect(user1).to_not be_valid
      end

      # validate password minimum length
      it "is not valid if password length less than 6" do
      user1 = User.new(name: 'Jane Doe', email: 'janedoe@gmail.com', password: '123', password_confirmation: '123')      
      expect(user1).to_not be_valid
      end
    end
  
    describe '.authenticate_with_credentials' do
      # examples for this class method here
      it 'is not nil with correct email and password' do
        user1 = User.create(name: 'Kelly', email: 'kelly@gmail.com', password: 'kelly123', password_confirmation: 'kelly123')
        user1_login = User.authenticate_with_credentials(user1.email, user1.password)
        expect(user1_login).to_not be_nil
      end

      it 'return nil if without correct password' do
        user1 = User.create(name: 'Kelly', email: 'kelly@gmail.com', password: 'kelly123', password_confirmation: 'kelly123')
        user1_login = User.authenticate_with_credentials(user1.email, 123456)
        expect(user1_login).to be_nil
      end

      it 'returns user if there is extra spaces in email' do
        user1 = User.create(name: 'Kelly', email: 'kelly@gmail.com', password: 'kelly123', password_confirmation: 'kelly123')
        user1_login = User.authenticate_with_credentials(' kelly@gmail.com ', user1.password)
        expect(user1_login).to_not be_nil
      end

      it 'works even if email is in different case' do 
        user1 = User.create(name: 'Kelly', email: 'kelly@gmail.com', password: 'kelly123', password_confirmation: 'kelly123')
        user1_login = User.authenticate_with_credentials('KELLY@Gmail.com ', user1.password)
        expect(user1_login).to_not be_nil
      end
    end
  end