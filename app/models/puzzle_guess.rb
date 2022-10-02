class PuzzleGuess < Struct.new(:it_phrase, :puzzle_id)
  include ActiveModel::Model
end
