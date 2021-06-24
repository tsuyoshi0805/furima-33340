require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
    before do
      @orderaddress = FactoryBot.build(:order_address)
    end
          it '全ての値が正しく入力されていれば購入できること' do
            expect(@orderaddress).to be_valid
          end

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
          @orderaddress.shipping_area_id = 0
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("User can't be blank")
          end

          it 'cityが空だと購入できない' do
          @orderaddress.city = nil
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("City can't be blank")
          end

          it 'addressが空だと購入できない' do
          @orderaddress.address = nil
          @orderaddress.valid?
            expect(@orderaddress.errors.full_messages).to include("Item can't be blank")
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
    
        end
     
