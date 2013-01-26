# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    file_name "MyString"
    created_at "2013-01-25 16:08:08"
    user_id 1
  end
end
