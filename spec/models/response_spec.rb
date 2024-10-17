require 'rails_helper'

RSpec.describe Response, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:question1) { FactoryBot.create(:question, question_type: "multiple_choice") }
  let(:question2) { FactoryBot.create(:question, question_type: "checkbox") }
  let(:question3) { FactoryBot.create(:question, question_type: "short_text") }
  let(:question4) { FactoryBot.create(:question, question_type: "long_text") }
  let(:option) { FactoryBot.create(:option, question: question1) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should belong_to(:selected_option).optional }
  end

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:question) }

    context "when creating a response" do
      it "is valid with selected option for multiple choice question" do
        response = FactoryBot.build(:response, user: user, question: question1, selected_option: option)
        expect(response).to be_valid
      end

      it "is valid with selected option for checkbox question" do
        response = FactoryBot.build(:response, user: user, question: question2, selected_option: option)
        expect(response).to be_valid
      end

      it "is valid with text response for short text question" do
        response = FactoryBot.build(:response, user: user, question: question3, text_response: "response")
        expect(response).to be_valid
      end

      it "is valid with text response for long text question" do
        response = FactoryBot.build(:response, user: user, question: question4, text_response: "response")
        expect(response).to be_valid
      end

      it "is not valid without a user" do
        response = FactoryBot.build(:response, user: nil, question: question1, selected_option: option)
        expect(response).not_to be_valid
        expect(response.errors[:user]).to include("can't be blank")
      end

      it "is not valid without a question" do
        response = FactoryBot.build(:response, user: user, question: nil, selected_option: option)
        expect(response).not_to be_valid
        expect(response.errors[:question]).to include("can't be blank")
      end

      it "is not valid without a selected option for multiple choice question" do
        response = FactoryBot.build(:response, user: user, question: question1, selected_option: nil)
        expect(response).not_to be_valid
        expect(response.errors[:selected_option]).to include("must be provided for multiple choice or checkbox questions")
      end

      it "is not valid without a text response for short text question" do
        response = FactoryBot.build(:response, user: user, question: question3, text_response: nil)
        expect(response).not_to be_valid
        expect(response.errors[:text_response]).to include("must be provided for text-based questions")
      end

      it "is not valid if text response exceeds 255 characters for short text question" do
        text = "a" * 256
        response = FactoryBot.build(:response, user: user, question: question3, text_response: text)
        expect(response).not_to be_valid
        expect(response.errors[:text_response]).to include("should not be longer than 255 characters for short text")
      end
    end
  end
end
