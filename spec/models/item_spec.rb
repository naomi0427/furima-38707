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
  end
end
