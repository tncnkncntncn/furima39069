require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name、name、first_name_kana、name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
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
        @user.password = 't23456'
        @user.password_confirmation = 't34567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
  
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
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
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
  
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字を含む６文字以上の半角英数字で入力してください')
      end

      it '英字のみのパスワードでは登録できない'do
         @user.password = 'aefhjk'
         @user.password_confirmation = 'aefhjk'
         @user.valid? 
         expect(@user.errors.full_messages).to include('Password は英字と数字を含む６文字以上の半角英数字で入力してください')     
      end
      it '全角文字を含むパスワードでは登録できない'do
         @user.password = '123ＤＥＦ'
         @user.password_confirmation = '123ＤＥＦ'
         @user.valid? 
      expect(@user.errors.full_messages).to include('Password は英字と数字を含む６文字以上の半角英数字で入力してください')     
      end


      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_name 姓（全角）に半角文字が含まれていると登録できない'do
        @user.first_name ='Ohtani'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力してください')
      end
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'name 全角）に半角文字が含まれていると登録できない'do
        @user.name ='Syohei'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name 全角で入力してください')
      end

      it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'name_kanaが空では登録できない' do
      @user.name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana can't be blank")
    end

    it 'first_name_kanaがカタカナでなければ登録できない' do

      @user.first_name_kana = '大谷'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力してください")
    end

    it 'name_kanaがカタカナでなければ登録できない' do
      @user.name_kana = '翔平'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana 全角カタカナで入力してください")
    end

    it '生年月日が空だと登録できない'do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end
  end

  end
  end
