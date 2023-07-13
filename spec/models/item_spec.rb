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
        it "categoryが---では登録できない" do
          @item.category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it "categoryが---では登録できない" do
          @item.condition_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Condition can't be blank"
        end
        it "postageが---では登録できない" do
          @item.postage_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Postage can't be blank"
        end
        it "prefectureが---では登録できない" do
          @item.prefecture_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture can't be blank"
        end
        it "shipmentが---では登録できない" do
          @item.shipment_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipment can't be blank"
        end
        it "価格に半角数字以外が含まれている場合は出品できない" do
          @item.price = "111a"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end
        it "価格が9_999_999円を超えると出品できない" do
          @item.price = "1000000"
          @item.valid?
          
          expect(@item.errors.full_messages).to include "Price must be less than 1000000"
        end
        it "userが紐付いていなければ出品できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "User must exist"
        end
        it '入力が存在すれば登録できる' do
          expect(@item).to be_valid
        end
        



        

      end
      
end
