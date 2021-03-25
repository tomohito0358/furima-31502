FactoryBot.define do
  factory :order_buy do
    token               {'aaaaaaaaa'}
    postal_code         {'123-4567'}
    prefecture_id       {2}
    city                {'東京'}
    address_number      {'111'}
    name_of_building    {"あア亜"}
    tell                {'09011112222'}
  end
end