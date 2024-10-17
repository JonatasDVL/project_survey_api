require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:question) { FactoryBot.create(:question) }

  describe "associations" do
    it { should belong_to(:question) }
    it { should have_many(:responses).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:question) }

    context "when creating a option" do
      it "is valid with valid attributes" do
        option = FactoryBot.build(:option, text: "text", question: question)
        expect(option).to be_valid
      end

      it "is not valid without a text" do
        option = FactoryBot.build(:option, text: nil)
        expect(option).not_to be_valid
        expect(option.errors[:text]).to include("can't be blank")
      end

      it "is not valid without a question" do
        option = FactoryBot.build(:option, question: nil)
        expect(option).not_to be_valid
        expect(option.errors[:question]).to include("can't be blank")
      end
    end
  end
end