class OrderBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_number, :name_of_building, :tell, :user_id, :item_id, :token

  with_options                     presence: true do
    validates :postal_code,        format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,      numericality: { other_than: 1 }
    validates :city,               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :address_number
    validates :tell,     format: { with: /\A\d{10,11}\z/, maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_number: address_number, name_of_building: name_of_building, tell: tell, buy_id: buy.id)
  end

end