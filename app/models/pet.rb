class Pet < ApplicationRecord
  has_many :registrations
  has_many :users, through: :registrations 
  validates_presence_of :name 
  validates_presence_of :animal
end
