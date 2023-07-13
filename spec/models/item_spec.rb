require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する場合' do
        it "nameが空では登録できない" do
          item = Item.new(name: '', price: '300', explanation: 'テスト', category_id: '2', condition_id: '2', postage_id: '2',prefecture_id: '2',shipment_id: '2')
          item.valid?
          expect(item.errors.full_messages).to include "Name can't be blank"
        end
        it "priceが空では登録できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank", "Price is not a number"
        end
        it "priceが300以下では登録できない" do
          item = Item.new(name: 'urano', price: '200', explanation: 'テスト', category_id: '2', condition_id: '2', postage_id: '2',prefecture_id: '2',shipment_id: '2')
          item.valid?
          expect(item.errors.full_messages).to include "Price must be greater than 299"
        end
        it "imageが空では登録できない" do
          item = Item.new( name: '', price: '300', explanation: 'テスト', category_id: '2', condition_id: '2', postage_id: '2',prefecture_id: '2',shipment_id: '2')
          item.image = nil
          item.valid?
          expect(item.errors.full_messages).to include "Image can't be blank"
        end
        it "explanationが空では登録できない" do
          @item.explanation = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Explanation can't be blank"
        end
        it "category_idが空では登録できない" do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it "condition_idが空では登録できない" do
          @item.condition_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Condition can't be blank"
        end
        it "postage_idが空では登録できない" do
          @item.postage_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Postage can't be blank"
        end
        it "prefecture_idが空では登録できない" do
          @item.prefecture_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture can't be blank"
        end
        it "shipment_idが空では登録できない" do
          @item.shipment_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipment can't be blank"
        end
        







      end
      
end
