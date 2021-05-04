require 'rails_helper'

#RSpec.describe User, type: :model do
 # describe "ユーザー新規登録" do


    describe User do
      describe '#create' do
    
        it "nickname、first_name、family_name、first_kana、family_name_kana、email、password、password_confirmation、birthdayが存在すれば登録できること" do
          @user = FactoryBot.build(:user)
          expect(@user).to be_valid
        end
    
        it "nicknameがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, nickname: nil)
          @user.valid?
          expect(@user.errors[:nickname]).to include("can't be blank")
        end
    
        it "emailがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, email: nil)
          @user.valid?
          expect(@user.errors[:email]).to include("can't be blank")
        end
    
        it "emailに@がない場合は登録できないこと " do
          @user = FactoryBot.build(:user, email: "aaaaaa")
          @user.valid?
          expect(@user.errors[:email]).to include("is invalid")
        end
    
        it "重複したemailが存在する場合登録できないこと" do
          @user = FactoryBot.create(:user, )
          @another_user = FactoryBot.build(:user, email: @user.email)
          @another_user.valid?
          expect(@another_user.errors[:email]).to include("has already been taken")
        end
    
        it "passwordがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, password: nil)
          @user.valid?
          expect(@user.errors[:password]).to include("can't be blank")
        end
    
        it "passwordが6文字以上であれば登録できること" do
          password = Faker::Internet.password(min_length: 6, max_length: 6)
          @user = FactoryBot.build(:user, password: password, password_confirmation: password)
          @user.valid?
          expect(@user).to be_valid
        end
    
        it "passwordが5文字以下であれば登録できないこと" do
          password = Faker::Internet.password(min_length: 5, max_length: 5)
          @user = FactoryBot.build(:user, password: password, password_confirmation: password)
          @user.valid?
          expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
        end
    
        it "passwordが6文字以上で、英数字の組み合わせであれば登録できること" do
          @user = FactoryBot.build(:user, password: "abcd12", password_confirmation: "abcd12")
          @user.valid?
          expect(@user).to be_valid
        end
    
        it "passwordが数字のみの場合は登録できないこと" do
          @user = FactoryBot.build(:user, password: "1234567", password_confirmation: "1234567")      
          @user.valid?
          
          expect(@user.errors[:password]).to include("is invalid")
        end
    
        it "passwordが英文字のみの場合は登録できないこと" do
          @user = FactoryBot.build(:user, password: "abcdefg", password_confirmation: "abcdefg")
          @user.valid?
          expect(@user.errors[:password]).to include("is invalid")
        end
    
        it "password_confirmationがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, password_confirmation: nil)
          @user.valid?
          expect(@user.errors[:password_confirmation]).to include()
        end
    
        it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
          @user = FactoryBot.build(:user, password: "abcd123", password_confirmation: "1234abc")
          
          @user.valid?
          expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
        end
    
        it "first_nameがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, first_name: nil)
          @user.valid?
          expect(@user.errors[:first_name]).to include("can't be blank")
        end
    
        it "last_nameがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, family_name: nil)
          @user.valid?
          expect(@user.errors[:family_name]).to include("can't be blank")
        end
    
        it "first_name_kanaがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, first_name_kana: nil)
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include("can't be blank")
        end
    
        it "family_name_kanaがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, family_name_kana: nil)
          @user.valid?
          expect(@user.errors[:family_name_kana]).to include("can't be blank")
        end
    
        it "birthdayがない場合は登録できないこと" do
          @user = FactoryBot.build(:user, birthday: nil)
          @user.valid?
          expect(@user.errors[:birthday]).to include("can't be blank")
        end
      end
    
      describe '#ぜんかく' do
    
        it "first_nameが全角文字であれば登録できること" do
          @user = FactoryBot.build(:user, first_name: "ぜんかく")
          @user.valid?
          expect(@user).to be_valid
        end
    
        it "family_nameが全角文字であれば登録できること" do
          @user = FactoryBot.build(:user, family_name: "ぜんかく")
          @user.valid?
          expect(@user).to be_valid
        end
    
      end
    
      describe '#ゼンカクカナ' do
    
        it "first_kanaが全角カナ文字であれば登録できること" do
          @user = FactoryBot.build(:user, first_name_kana: "ゼンカクカナ")
          @user.valid?
          expect(@user).to be_valid
        end
    
        it "family_name_kanaが全角カナ文字であれば登録できること" do
          @user = FactoryBot.build(:user, family_name_kana: "ゼンカクカナ")
          @user.valid?
          expect(@user).to be_valid
        end
    
      end
    end