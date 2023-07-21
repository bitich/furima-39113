class Add < ApplicationRecord
  belongs_to :order
  #belongs_to :prefecture 
  extend ActiveHash::Associations::ActiveRecordExtensions

end
