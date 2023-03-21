require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、first_name name、first_name_kana、name_kana、birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  
  context '新規登録できないとき' do
    it 'nick_nameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
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
      expect(another_user.errors.full_messages).to include('Email has already been taken')
      #生成した@userをテーブルに保存した後に、再度別のユーザーanother_userを生成します。
      #そして、another_userのemailに、すでに保存済みの@userのemailを上書きしています。その上でanother_userが保存されるかどうかを判別しています。
      #エラーメッセージはEmail has already been takenです。
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
      #@userのemailを、@を含まないtestmailという文字列に上書きしています。その上で@userが保存されるかどうかを判別
      #エラーメッセージはEmail is invalid

    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 't0000'
      @user.password_confirmation = 't0000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)"
    end
    it 'passwordが数字だけでは登録できない' do
      user = FactoryBot.build(:user)
      user.password = '12345678'
      user.valid?
      expect(user.errors.full_messages).to include("Passwordは半角英字と数字の両方を含めて設定してください")
    end

  end
 end
end
