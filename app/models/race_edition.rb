# == Schema Information
#
# Table name: race_editions
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  name       :string           not null
#  slug       :string           not null
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_race_editions_on_slug  (slug) UNIQUE
#
class RaceEdition < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged
end
