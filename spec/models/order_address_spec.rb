require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @orderaddress = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

context '購入ができる時（正常系）' do  

          it '全ての値が正しく入力されていれば購入できること' do
            expect(@orderaddress).to be_valid
          end
          
          it 'building_nameが空でも購入できること' do
            @orderaddress.building_name = nil
            @orderaddress.valid?
            end
          end

context '購入ができない時（異常系）' do   
       
          it 'post_codeが空だと購入できない' do
          @orderaddress.post_code = nil
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Post code is invalid")
          end

          it 'post_codeにハイフンがないと購入できない' do
          @orderaddress.post_code = "1234567"
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Post code is invalid")
          end

          it 'shipping_areaが未選択だと購入できない' do
          @orderaddress.shipping_area_id = 1
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Shipping area must be other than 1")
          end

          it 'cityが空だと購入できない' do
          @orderaddress.city = nil
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("City can't be blank")
          end

          it 'addressが空だと購入できない' do
          @orderaddress.address = nil
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Address can't be blank")
          end

          it 'phone_numberが空だと購入できない' do
          @orderaddress.phone_number = nil
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Phone number is invalid")
          end

          it 'phone_numberが9桁では購入できない' do
          @orderaddress.phone_number = "090123456"
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Phone number is invalid")
          end

          it "tokenが空では登録できないこと" do
            @orderaddress.token = nil
            @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Token can't be blank")
          end
        end
      end


