require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @after_sales = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
  end

  describe "商品購入" do
    context "購入できる時" do
      it "項目が全て条件をクリアした時購入ができる" do
        expect(@after_sales).to  be_valid
      end
      it "建物名が空の時も購入ができる" do
        @after_sales.to_building_name = ' '
        expect(@after_sales).to be_valid
      end
    end

    context "購入できない時" do
      it "購入者が空では登録できない" do
        @after_sales.user_id = ''
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("User can't be blank")
      end
      it "購入商品が空では登録できない" do
        @after_sales.item_id = nil
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("Item can't be blank")
      end

      it "郵便番号が空では登録できない" do
        @after_sales.post_code = ''
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号が正しい形じゃないと登録できない" do
        @after_sales.post_code = '1234567'
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it "都道府県が空では登録できない" do
        @after_sales.from_prefecture_id = ''
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("From prefecture can't be blank")
      end
      it "都道府県が「---」では登録できない" do
        @after_sales.from_prefecture_id = '1'
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("From prefecture can't be blank")
      end
      
      it "市町村が空では登録できない" do
        @after_sales.to_city = ''
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("To city can't be blank")
      end
      
      it "番地が空では登録できない" do
        @after_sales.to_house_number = ''
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("To house number can't be blank")
      end

      it "電話番号が空では登録できない" do
        @after_sales.to_telephone_number = ''
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("To telephone number can't be blank")
      end
      it "電話番号が正しい形じゃないと登録できない" do
        @after_sales.to_telephone_number = '０９０１２３４５６７８'
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("To telephone number is invalid")
      end
      it "電話番号が9桁だと登録できない" do
        @after_sales.to_telephone_number = '123456789'
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("To telephone number is invalid")
      end
      it "電話番号が12桁だと登録できない" do
        @after_sales.to_telephone_number = '123456789012'
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("To telephone number is invalid")
      end

      it "tokenが空では登録できない" do
        @after_sales.token = nil
        @after_sales.valid?
        expect(@after_sales.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end