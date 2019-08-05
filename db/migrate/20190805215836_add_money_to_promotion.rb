class AddMoneyToPromotion < ActiveRecord::Migration[5.1]
  def change
    add_column :promotions, :cash, :integer
  end
end
