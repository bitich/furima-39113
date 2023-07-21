class OrderAdd

  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :address, :build, :tell, :user_id, :item_id

  
  validates :post, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence:true
  validates :address, presence: true
  validates :tell, presence:true
  validates :user_id, presence:true
  validates :item_id, presence:true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Add.create(post: post, prefecture_id: prefecture_id,  city: city, address: address, build: build, tell: tell, order_id: order.id )
  end

end