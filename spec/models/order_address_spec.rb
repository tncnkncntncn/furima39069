require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user, item_id: @item)
  end

  context '内容に問題ない場合' do
    it "購入ができる時" do
      expect(@order_address).to be_valid
    end
    it '建物の入力がなくても購入できる' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では登録できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にーがなければ登録できないこと' do
      @order_address.postal_code = 1234567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code ○:123-4567 ×:1234567")
    end
    it '郵便番号は半角でなければ登録できないこと' do
      @order_address.postal_code = '１２３-４５６７'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code ○:123-4567 ×:1234567")
    end
    it '都道府県が空では登録できないこと' do
      @order_address.region_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Region can not be blank")
    end
    it '市町村が空では登録できないこと' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では登録できないこと' do
      @order_address.street = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street can't be blank")
    end
    it "電話番号がないと保存できない" do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が９桁では保存できない" do
      @order_address.phone_number = '090123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number 半角数字で入れてください。○:09012345678  ×:090-1234-5678")
    end
    it "電話番号が12桁以上では保存できない" do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number 半角数字で入れてください。○:09012345678  ×:090-1234-5678")
    end
    it "紐づいているuser_idがないと保存できない" do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it "紐づいているitem_idがないと保存できない" do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
end
end
end