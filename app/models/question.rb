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
#  slug                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  race_edition_id       :bigint
#
# Indexes
#
#  index_questions_on_slug  (slug) UNIQUE
#
class Question < ApplicationRecord
  extend FriendlyId

  has_one_attached :slide

  friendly_id :slug_candidates, use: :slugged

  enum answer_type: { single_choice: 0 }
  enum question_source_type: { no_text: 0, text: 1 }

  validates :answer_type, :name, :slide, presence: true

  has_many :answers, dependent: :destroy
  belongs_to :race_edition, optional: true

  has_rich_text :introduction
  has_rich_text :remarks

  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: proc { |attr| attr['name'].blank? }

  def race_edition_slug
    race_edition&.slug
  end

  def slug_candidates
    [
      [:race_edition_slug, :name],
      :name
    ]
  end

  def slide_as_thumbnail
    slide.variant(resize_to_limit: [300, 300]).processed
  end
end
