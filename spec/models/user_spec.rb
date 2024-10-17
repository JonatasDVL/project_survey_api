require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "associations" do
    it { should have_many(:surveys).dependent(:destroy) }
    it { should have_many(:responses).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value("user@example.com").for(:email) }
    it { should_not allow_value("user@com").for(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_presence_of(:role) }
    it { should validate_inclusion_of(:role).in_array([0, 1]) }

    context "when creating a user" do
      it "is valid with valid attributes" do
        user = FactoryBot.build(:user, name: "nome", email: "nome@example.com", password: "123456", role: 1)
        expect(user).to be_valid
      end

      it "is not valid without a name" do
        user = FactoryBot.build(:user, name: nil)
        expect(user).not_to be_valid
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "is not valid if name is too short" do
        user = FactoryBot.build(:user, name: "A")
        expect(user).not_to be_valid
        expect(user.errors[:name]).to include("is too short (minimum is 2 characters)")
      end

      it "is not valid with an improperly formatted email" do
        user = FactoryBot.build(:user, email: "email")
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("is invalid")
      end

      it "is not valid if email is already taken" do
        FactoryBot.create(:user, name: "nome", email: "nome@example.com", password: "123456", role: 1)
        user = FactoryBot.build(:user, name: "nome", email: "nome@example.com", password: "123456", role: 1)
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("has already been taken")
      end

      it "is not valid without an email" do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is not valid with a short password" do
        user = FactoryBot.build(:user, password: "12345")
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      it "is not valid without a password" do
        user = FactoryBot.build(:user, password: nil)
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is not valid with an invalid role" do
        user = FactoryBot.build(:user, role: 5)
        expect(user).not_to be_valid
        expect(user.errors[:role]).to include("is not included in the list")
      end

      it "is not valid without a role" do
        user = FactoryBot.build(:user, role: nil)
        expect(user).not_to be_valid
        expect(user.errors[:role]).to include("can't be blank")
      end
    end
  end
end
