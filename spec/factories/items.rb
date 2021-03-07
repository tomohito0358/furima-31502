FactoryBot.define do
  factory :item do
    association :user
    image                  {Faker::Lorem.sentence}
    name                   {Faker::Name.initials(number: 2)}
    introduction           {'test'}
    category_id            {'0'}
    status_id              {'0'}
    shipping_id            {'0'}
    prefecture_id          {'0'}
    date_of_shipment_id    {'0'}
    price                  {'0'}
  end
end
