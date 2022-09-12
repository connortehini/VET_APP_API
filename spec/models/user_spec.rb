require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test 
  # ensure User model has a 1:m relationship with the pet model 
  it { should have_many(:registrations)}
  it { should have_many(:pets).through(:registrations) }
  #Validation tests
  # ensure name, email, password and role are present before save 
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password) }
  it {should validate_presence_of(:role)}
end
