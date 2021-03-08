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
  with_options                numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :date_of_shipment_id
  end


  with_options                    presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :shipping_id 
    validates :prefecture_id
    validates :date_of_shipment_id
    validates :price,format: { with: /\A[0-9]+\z/},inclusion: { in: 300..9999999 }

  end
end