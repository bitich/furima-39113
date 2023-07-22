class CreateAdds < ActiveRecord::Migration[6.0]
  def change
    create_table :adds do |t|
      t.references :order, null: false,foreign_key:true
      t.string :post, null: false
      t.integer :prefecture_id ,null:false
      t.string :city, null: false
      t.string :address, null: false
      t.string :build
      t.string :tell, null:false  
      t.timestamps
    end
  end
end
