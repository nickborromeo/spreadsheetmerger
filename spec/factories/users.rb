# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "foobar#{n}@example.com" }
    f.password "secretpassword"
  end
end
