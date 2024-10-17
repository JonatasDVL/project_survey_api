require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:survey) { FactoryBot.create(:survey) }

  describe "validations" do
    it { should validate_presence_of(:survey) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_least(6) }
    it { should validate_presence_of(:question_type) }
    it { should validate_inclusion_of(:question_type).in_array(["short_text", "long_text", "multiple_choice", "checkbox"]) }
  
    context "when creating a question" do
      it "is valid with valid attributes" do
        question = FactoryBot.build(:question, survey: survey, text: "textooo", question_type: "short_text")
        expect(question).to be_valid
      end
  
      it "is not valid without a survey" do
        question = FactoryBot.build(:question, survey: nil)
        expect(question).not_to be_valid
        expect(question.errors[:survey]).to include("can't be blank")
      end
  
      it "is not valid without a text" do
        question = FactoryBot.build(:question, text: nil)
        expect(question).not_to be_valid
        expect(question.errors[:text]).to include("can't be blank")
      end
  
      it "is not valid if text is too short" do
        question = FactoryBot.build(:question, text: "12345")
        expect(question).not_to be_valid
        expect(question.errors[:text]).to include("is too short (minimum is 6 characters)")
      end
  
      it "is not valid without a question_type" do
        question = FactoryBot.build(:question, question_type: nil)
        expect(question).not_to be_valid
        expect(question.errors[:question_type]).to include("can't be blank")
      end
  
      it "is not valid with an invalid question_type" do
        question = FactoryBot.build(:question, question_type: "asd")
        expect(question).not_to be_valid
        expect(question.errors[:question_type]).to include("is not included in the list")
      end
    end
  end
end