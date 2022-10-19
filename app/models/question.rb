# == Schema Information
#
# Table name: questions
#
#  id                    :bigint           not null, primary key
#  answer_type           :integer          not null
#  name                  :string           not null
#  position              :integer
#  question_source_type  :integer          not null
#  question_source_value :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Question < ApplicationRecord
  has_one_attached :slide

  enum answer_type: { single_choice: 0 }
  enum question_source_type: { no_text: 0, text: 1 }

  validates :answer_type, :name, :slide, presence: true

  has_many :answers, dependent: :destroy

  has_rich_text :introduction
  has_rich_text :remarks

  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }

  def slide_as_thumbnail
    slide.variant(resize_to_limit: [300, 300]).processed
  end
end
