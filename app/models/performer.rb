class Performer < ApplicationRecord
  belongs_to :promotion, optional: true
end
