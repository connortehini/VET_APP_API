require 'rails_helper'

RSpec.describe Registration, type: :model do
  it {should have_many(:appointments).dependent(:destroy)}
  it {should belong_to(:pet)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:reg_type) }
  it { should validate_presence_of(:acceptance)}
  it { should validate_presence_of(:created_at)}
end
