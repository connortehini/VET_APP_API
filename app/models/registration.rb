class Registration < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :appointments, dependent: :destroy
  validates_presence_of :reg_type, :acceptance, :created_at
end
