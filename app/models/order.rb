class Order < ApplicationRecord
  belongs_to :user
  has_one :add
  belongs_to :item

  

end
