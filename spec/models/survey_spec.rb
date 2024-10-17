require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:questions).dependent(:destroy) }
    it { should have_many(:responses).through(:questions).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:user) }

    context "when creating a survey" do
      it "is valid with valid attributes" do
        survey = FactoryBot.build(:survey, user: user, title: "title", start_date: "2024-10-03 19:53:16", end_date: "2024-10-04 19:53:16")
        expect(survey).to be_valid
      end

      it "is not valid without a title" do
        survey = FactoryBot.build(:survey, title: nil)
        expect(survey).not_to be_valid
        expect(survey.errors[:title]).to include("can't be blank")
      end

      it "is not valid if title is too short" do
        survey = FactoryBot.build(:survey, title: "Oi")
        expect(survey).not_to be_valid
        expect(survey.errors[:title]).to include("is too short (minimum is 3 characters)")
      end

      it "is not valid without a start_date" do
        survey = FactoryBot.build(:survey, start_date: nil)
        expect(survey).not_to be_valid
        expect(survey.errors[:start_date]).to include("can't be blank")
      end

      it "is not valid without an end_date" do
        survey = FactoryBot.build(:survey, end_date: nil)
        expect(survey).not_to be_valid
        expect(survey.errors[:end_date]).to include("can't be blank")
      end

      it "is not valid if end_date is before or same as start_date" do
        survey = FactoryBot.build(:survey, start_date: "2024-10-03 19:53:16", end_date: "2024-10-03 19:53:16")
        expect(survey).not_to be_valid
        expect(survey.errors[:end_date]).to include("must be after the start date")
      end

      it "is not valid without a user" do
        survey = FactoryBot.build(:survey, user: nil)
        expect(survey).not_to be_valid
        expect(survey.errors[:user]).to include("can't be blank")
      end
    end
  end
end