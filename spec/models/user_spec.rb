require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.create(name: 'Jone Doe', email: 'jonedoe@gmail.com',
      password:'123', password_confirmation: '123')
    }
    
    describe 'Validations' do

      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
    
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

      it "is not valid without a matching password" do
        user1 = User.create(name: 'James', email: 'james@gmail.com', password: 'james123', password_confirmation: 'jam123')
        expect(user1).to_not be_valid
      end

      it "is not valid without an unique email" do
        User.create(name: 'Jone Doe', email: 'jonedoe@gmail.com', password: '123', password_confirmation: '123') 
        user1 = User.new(name: 'Jone Doe', email: 'JONEDOE@gmail.com', password: '123', password_confirmation: '123')      
        expect(user1).to_not be_valid
      end

    end
end
