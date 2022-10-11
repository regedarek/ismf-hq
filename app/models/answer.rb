# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  correct     :boolean          default(FALSE), not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question

  validates :name, presence: true
  validates :name, uniqueness: { scope: :question_id }

  validate :only_answer_correct_in_single_choice

  def only_answer_correct_in_single_choice
    if correct && question.single_choice?
      if question.answers.select(&:correct).count > 1
        errors.add(:base, "Może być tylko jedna poprawna odpowiedź")
      end
    end
  end
end
