class OrderAdd

  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :address, :build, :tell, :user_id, :item_id, :token

  
  validates :post, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  with_options presence:true do
  validates :city
  validates :user_id
  validates :item_id
  validates :token
  validates :address
  validates :tell, format:{ with: /\A\d{10,11}\z/}
  end
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Add.create(post: post, prefecture_id: prefecture_id,  city: city, address: address, build: build, tell: tell, order_id: order.id )
  end

end