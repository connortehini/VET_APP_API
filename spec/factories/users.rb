FactoryBot.define do
  factory :user do
    name { "Connor" }
    email { "ctehini@gmail.com" }
    password { "123456" }
    role { 1 }
  end
end
