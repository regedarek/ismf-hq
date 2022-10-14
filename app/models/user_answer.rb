# == Schema Information
#
# Table name: user_answers
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_user_answers_on_question_id  (question_id)
#  index_user_answers_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class UserAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  has_many :user_choices, dependent: :destroy
  has_many :answers, through: :user_choices

  has_rich_text :body
end
