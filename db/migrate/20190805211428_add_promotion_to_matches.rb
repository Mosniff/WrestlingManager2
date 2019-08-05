class AddPromotionToMatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :promotion, foreign_key: true
  end
end
