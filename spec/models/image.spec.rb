require 'rails_helper'

describe Image do
  describe '#new' do

    it "画像ないと登録できない" do
      image = build(:image, src: nil)
      image.valid?

      expect(image.errors[:src]).to include("を入力してください")
    end
  end
  
end