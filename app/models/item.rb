class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation 
    validates :price, numericality: {only_integer: true,greater_than:299,less_than:1000000}
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :condition 
  belongs_to :postage 
  belongs_to :prefecture 
  belongs_to :shipment 
  
  validates :category_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_id , numericality: { other_than: 1 , message: "can't be blank"}

end
