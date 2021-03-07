class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :date_of_shipment
  
  has_one_attached :image

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :status_id, numericality: { other_than: 1 } 

  with_options                    presence: true do
    validates :image
    validates :name
    validates :introduction 
    validates :category_id
    validates :status_id
    validates :shipping_id 
    validates :prefecture_id
    validates :date_of_shipment_id
    validates :price
  end

end
