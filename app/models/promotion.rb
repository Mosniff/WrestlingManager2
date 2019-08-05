class Promotion < ApplicationRecord
  belongs_to :user
  has_many :performers

  after_create :initialize_promotion

  private 

  def initialize_promotion
    ActiveRecord::Base.transaction do
      25.times do
        Performer.create(promotion_id: self.id)
      end
    end
    self.update(cash: 10000)
  end
end
