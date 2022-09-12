require 'rails_helper'

RSpec.describe Pet, type: :model do
 it {should have_many(:registrations)}
 it {should have_many(:users).through(:registrations)}

 it {should validate_presence_of(:name)}
 it {should validate_presence_of(:animal)}
end
