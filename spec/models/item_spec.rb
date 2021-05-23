require 'rails_helper'

RSpec.describe Item, type: :model do
    describe Item do
      describe '#create' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.build(:item, user_id: @user.id)
        end
      



    it "全ての条件を入力すると登録ができる" do
      
      expect(@item).to be_valid
    end

    it "商品名がなければ登録できない" do
      @item.name = ''
      
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    #   通常の記述はinclude("can't be blank"")だが、
    #   models.item.rbのバリデーションで
    #   "入力してください"と空投稿で表示されるように変更している為、
    #   include("入力してください")で記載。

    it "価格がなければ登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "商品の説明がなければ登録できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリーがなければ登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態がなければ登録できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "配送料の負担がなければ登録できない" do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end

    it "発送元の地域がなければ登録できない" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it "発送までの日数がなければ登録できない" do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end
  it "299円以下では登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
  end
  it "10,000,000以上では登録できないこと"do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
  end
  it "全角文字では登録できないこと"do
      @item.price = "テスト"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
  end
  it "英数混合では登録できないこと"do
      @item.price = "abc123"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
  end
  it "半角英語のみでは登録できないこと"do
     @item.price = "abcd"
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not included in the list")
  end
  it "画像がなければ登録できない"do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
  end
end
end
end

