class Response < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :selected_option, class_name: 'Option', optional: true
end
