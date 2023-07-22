require 'rails_helper'

RSpec.describe OrderAdd, type: :model do

    describe '購入情報の保存' do
      before do
      
        user = FactoryBot.create(:user)
        @order_add = FactoryBot.build(:order_add, user_id: user.id,item_id:"1")
      end
  
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_add).to be_valid
        end
        it 'buildは空でも保存できること' do
          @order_add.build = nil
          expect(@order_add).to be_valid
        end
      end
  
      context '内容に問題がある場合' do
        it 'postが空だと保存できないこと' do
          @order_add.post = ""
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Post を入力してください"
        end
        it 'cityが空だと保存ができない' do
          @order_add.city = ""
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "City can't be blank"
        end
        it 'prefecture_idを選択していないと保存できないこと' do
          @order_add.prefecture_id = ""
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Prefecture can't be blank"
        end
        it 'prefecture_idgの選択が『----』保存できないこと' do
          @order_add.prefecture_id = 1
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Prefecture can't be blank"
        end
        it 'addressが空だと保存できないこと' do
          @order_add.address = ""
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Address can't be blank"
        end
        it 'tellが空だと保存できないこと' do
          @order_add.tell = ""
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Tell is invalid"
        end
        it 'userが紐付いていないと保存できないこと' do
          @order_add.user_id = nil
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "User can't be blank"
        end
        it 'itemが紐付いていないと保存できないこと' do
          @order_add.item_id = nil
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Item can't be blank"
        end
        it 'tokenが空だと保存できないこと' do
          @order_add.token = ""
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Token can't be blank"
        end
        it '電話番号が９桁以下では購入できない' do
          @order_add.tell = "111111"
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Tell is invalid"
        end
        it '電話番号が12桁以上では購入できない' do
          @order_add.tell = "111111111111"
          @order_add.valid?
      
          expect(@order_add.errors.full_messages).to include "Tell is invalid"
        end
        it '電話番号が半角以外の数字では購入できない' do
          @order_add.tell = "１１１１１１１１"
          @order_add.valid?
          expect(@order_add.errors.full_messages).to include "Tell is invalid"
        end






      end
    end
  end
  

 