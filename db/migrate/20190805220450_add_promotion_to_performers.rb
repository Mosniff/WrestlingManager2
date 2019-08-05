class AddPromotionToPerformers < ActiveRecord::Migration[5.1]
  def change
    add_reference :performers, :promotion, foreign_key: true
  end
end
