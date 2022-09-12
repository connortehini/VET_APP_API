class User < ApplicationRecord
  has_secure_password
  
  has_many :registrations, foreign_key: :created_at
  has_many :pets, through: :registrations

  validates_presence_of :name, :email, :password, :role 
end
