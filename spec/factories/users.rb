FactoryBot.define do

  factory :user do
    nickname         {Faker::Name.initials(number: 2)}
    email            {Faker::Internet.free_email}
    password         {Faker::Internet.password(min_length: 6)}
    first_name       {Faker::Name.initials(number: 2)}
    last_name        {Faker::Name.initials(number: 2)}
    first_name_read  {Faker::Name.initials(number: 2)}
    last_name_read   {Faker::Name.initials(number: 2)}
    birth_day        {Faker::Name.initials(number: 8)}
  end

end