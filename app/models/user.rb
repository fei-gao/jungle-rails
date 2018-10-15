class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews

    validates :name, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: false}
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates_length_of :password, minimum: 6
end
