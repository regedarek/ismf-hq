# == Schema Information
#
# Table name: puzzles
#
#  id         :bigint           not null, primary key
#  en_phrase  :string
#  it_phrase  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_puzzles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Puzzle < ApplicationRecord
  belongs_to :user

  validates :en_phrase, :it_phrase, :user_id, :thumbnail, presence: true

  has_one_attached :thumbnail
  has_rich_text :body
end
