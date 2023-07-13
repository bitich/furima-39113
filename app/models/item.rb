class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :name,presence:true
  validates :price, presence: true ,numericality: {greater_than:299,less_than:999999}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :condition 
  belongs_to :postage 
  belongs_to :prefecture 
  belongs_to :shipment 
  validates :explanation , presence:true
  validates :category_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_id , numericality: { other_than: 1 , message: "can't be blank"}

end
