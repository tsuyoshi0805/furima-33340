require 'rails_helper'


    describe User do
      before do
        @user = FactoryBot.build(:user)
        end
      describe '#create' do
    

context 'ユーザー登録ができるとき'


        it "nickname、first_name、family_name、first_kana、family_name_kana、email、password、password_confirmation、birthdayが存在すれば登録できること" do
          
          expect(@user).to be_valid
        end
    
      
    
        it "passwordが6文字以上であれば登録できること" do
          @user.password = 'abc123'
          @user.password_confirmation ='abc123'
          @user.valid?
          expect(@user).to be_valid
        end
    
        
    
        it "passwordが6文字以上で、英数字の組み合わせであれば登録できること" do
          @user.password = "abcd12"
          @user.password_confirmation = "abcd12"
          @user.valid?
          expect(@user).to be_valid
        end
    
    
        
    
      
     
     
      context 'ユーザー登録ができない時'

      it "nicknameがない場合は登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end
  
      it "emailがない場合は登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end
  
      it "emailに@がない場合は登録できないこと " do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end
  
      it "重複したemailが存在する場合登録できないこと" do
        @user = FactoryBot.create(:user )
        @another_user = FactoryBot.build(:user, email: @user.email)
        @another_user.valid?
        expect(@another_user.errors[:email]).to include("has already been taken")
      end
  
      it "passwordがない場合は登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
      
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end



      it "passwordが数字のみの場合は登録できないこと" do
        @user.password = "1234567"
        @user.password_confirmation = "1234567"      
        @user.valid?
        
        expect(@user.errors[:password]).to include("is invalid")
      end
  
      it "passwordが英文字のみの場合は登録できないこと" do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
  
      it "password_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include()
      end
  
      it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
        @user.password = "abcd123"
        @user.password_confirmation = "1234abc"
        
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
  
      it "first_nameがない場合は登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
  
      it "last_nameがない場合は登録できないこと" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors[:family_name]).to include("can't be blank")
      end
  
      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end
  




      it "family_name_kanaがない場合は登録できないこと" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("can't be blank")
      end




      it "birthdayがない場合は登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors[:birthday]).to include("can't be blank")
      end
    end






  

      before do
        @user = FactoryBot.build(:user)
        end
      describe '#ぜんかく' do
    
        it "first_nameが全角文字であれば登録できること" do
          @user.first_name = "ぜんかく"
          @user.valid?
          expect(@user).to be_valid
        end
    
        it "family_nameが全角文字であれば登録できること" do
          @user.family_name  = "ぜんかく"
          @user.valid?
          expect(@user).to be_valid
        end
    
      end
    




      before do
        @user = FactoryBot.build(:user)
        end
      describe '#ゼンカクカナ' do
    
        it "first_kanaが全角カナ文字であれば登録できること" do
          @user.first_name_kana = "ゼンカクカナ"
          @user.valid?
          expect(@user).to be_valid
        end
    
        it "family_name_kanaが全角カナ文字であれば登録できること" do
          @user.family_name_kana = "ゼンカクカナ"
          @user.valid?
          expect(@user).to be_valid
        end
    
      end
    end