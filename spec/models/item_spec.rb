require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do
    context "出品できる時" do
      it "項目が全て条件をクリアした時登録ができる" do
       expect(@item).to be_valid
      end
    end

    context "出品できない時" do
      it "商品画像がない時" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end

      it "商品名がない時" do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Items name can't be blank")
      end

      it "商品説明がない時" do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Explain can't be blank")
      end

      it "カテゴリー選択されてない時" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it "カテゴリーが「---」の時" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end

      it "商品の状態がない時" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it "商品の状態が「---」の時" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end

      it "配送料の負担がない時" do
        @item.tax_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Tax can't be blank")
      end
      it "配送料の負担が「---」の時" do
        @item.tax_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Tax can't be blank")
      end

      it "発送元の地域がない時" do
        @item.from_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("From prefecture can't be blank")
      end
      it "発送元の地域が「---」の時" do
        @item.from_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("From prefecture can't be blank")
      end

      it "発送までの日数がない時" do
        @item.schedule_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule day can't be blank")
      end
      it "#・発送までの日数が「---」の時" do
        @item.schedule_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule day can't be blank")
      end

      it "価格がない時" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が299円の時" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が10,000,000円の時" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "価格が全角の時" do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
      it "userが紐付いていない時" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
