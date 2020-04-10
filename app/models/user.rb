class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :password, length: { minimum: 6, maximum: 20 }, on: :create
end
