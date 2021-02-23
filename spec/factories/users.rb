FactoryBot.define do

  factory :user do
    nickname         {Faker::Name.initials(number: 2)}
    email            {Faker::Internet.free_email}
    password          { '1a' + Faker::Internet.password(min_length: 6) }
    first_name       {"あア亜"}
    last_name        {"あア亜"}
    first_name_read  {"ア"}
    last_name_read   {"ア"}
    birth_day        {"1930-01-01"}
  end

end