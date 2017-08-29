require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject(:user) do 
    User.create(
      username: "cr1tterp0wer",
      password: "123456"
    )
  end
    
  describe "password digest" do
    it "should bcrypt the password" do 
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "critter", password: "power")
    end
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }

end
