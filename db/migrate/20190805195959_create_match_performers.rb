class CreateMatchPerformers < ActiveRecord::Migration[5.1]
  def change
    create_table :match_performers do |t|
      t.references :performer, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
