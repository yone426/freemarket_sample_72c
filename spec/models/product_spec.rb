require 'rails_helper'
describe Product do

  describe '#new' do

    it "nameがないと登録できない"do
      product = build(:product, name: nil)
      product.valid?
      
      expect(product.errors[:name]).to include("can't be blank")
    end
    
    it "商品の説明がないと登録できない"do
      product = build(:product, details: nil)
      product.valid?

      expect(product.errors[:details]).to include("can't be blank")
    end

    it "categoriesがないと登録できない"do
      product = build(:product, categories: nil)
      product.valid?

      expect(product.errors[:categories]).to include("can't be blank")
    end

    it "conditionがないと登録できない"do
      product = build(:product, condition: nil)
      product.valid?
    
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "exhibitionがないと登録できない"do
      product = build(:product, exhibition: nil)
      product.valid?

      expect(product.errors[:exhibition]).to include("can't be blank")
    end

    # it "shippingareaがないと登録できない"do
    #   product = build(:product, shippingarea: nil)
    #   product.valid?

    #   expect(product.errors[:shippingarea]).to include("can't be blank")
    # end

    it "shippingdateがないと登録できない"do
      product = build(:product, shippingdate: nil)
      product.valid?

      expect(product.errors[:shippingdate]).to include("can't be blank")
    end 

    
  end
end