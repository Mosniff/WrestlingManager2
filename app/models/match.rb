class Match < ApplicationRecord
  belongs_to :promotion
  has_many :match_performers

  def perform_match
    if self.match_performers.count >= 2
      match_rating = rand(10) + 1
      self.update(match_rating: match_rating)
    else
      raise "More performers required for match!"
    end
  end

end