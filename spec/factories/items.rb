FactoryBot.define do
  factory :item do
    association :user
    name                   {Faker::Name.initials(number: 2)}
    introduction           {'test'}
    category_id            {'2'}
    status_id              {'2'}
    shipping_id            {'2'}
    prefecture_id          {'2'}
    date_of_shipment_id    {'2'}
    price                  {'2000'}
  end
end
