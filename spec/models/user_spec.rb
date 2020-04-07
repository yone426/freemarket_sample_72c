require 'rails_helper'
describe User do
  describe '空欄がある時のvalidates' do
    it "emailがないと登録できない"do
    user = build(:user, email: nil)
    user.valid?
    
    expect(user.errors[:email]).to include("は有効でありません。")
  end
    it "nicknameがないと登録できない"do
    user = build(:user, nickname: nil)
    user.valid?

    expect(user.errors[:nickname]).to include("を入力してください")
  end
    it "phonnumberがないと登録できない"do
    user = build(:user, phone_number: nil)
    user.valid?

    expect(user.errors[:phone_number]).to include("を入力してください")
  end
    it "birthdayがないと登録できない"do
    user = build(:user, birthday: nil)
    user.valid?
  
    expect(user.errors[:birthday]).to include("を入力してください")
  end
    it "fullnameがないと登録できない"do
    user = build(:user, fullname: nil)
    user.valid?

    expect(user.errors[:fullname]).to include("を入力してください")
  end
    it "fullname_katakanaがないと登録できない"do
    user = build(:user, fullname_katakana: nil)
    user.valid?

    expect(user.errors[:fullname_katakana]).to include("を入力してください")
  end 

  it '全てないと登録できない' do
    user = build(:user)
    expect(user).to be_valid
  end
  end


  describe '一意性'do
  it " 重複したemailが存在する場合は登録できないこと " do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("は既に使用されています。")
  end
end
end