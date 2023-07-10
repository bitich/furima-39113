require 'rails_helper'

RSpec.describe User, type: :model do
  before do
     @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'nicknameが7文字以上では登録できない' do
      @user.nickname = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end                                                   
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordが全角英数字では登録できない' do
      @user.password = '１２あ１２３'
      @user.password_confirmation = '１２あ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end

    it '名（全角）が空では登録できない' do
      @user.lastname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank", "Lastname 全角文字を使用してください")
    end

    it '性（全角）が空では登録できない' do
      @user.firstname = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname 全角文字を使用してください")
    end

    it '名（全角）が半角では登録できない' do
      @user.lastname = 'ﾄｼﾋﾛ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname 全角文字を使用してください")
    end

    it '性（全角）が半角では登録できない' do
      @user.firstname = 'ｳﾗﾉ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname 全角文字を使用してください")
    end

    it '名(カナ)が空では登録できない' do
      @user.lastnamekana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastnamekana can't be blank", "Lastnamekana 全角カタカナのみで入力して下さい")
    end

    it '性(カナ)が空では登録できない' do
      @user.firstnamekana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstnamekana can't be blank", "Firstnamekana 全角カタカナのみで入力して下さい")
    end

    it '名(カナ)が半角では登録できない' do
      @user.lastnamekana = '寿ひろ12a' 
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Lastnamekana 全角カタカナのみで入力して下さい")
    end

    it '性(カナ)が半角では登録できない' do
      @user.firstnamekana = '浦の12a' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstnamekana 全角カタカナのみで入力して下さい")
    end



    it '生年月日が空では登録できない' do
      @user.birthday = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    
    end
end

