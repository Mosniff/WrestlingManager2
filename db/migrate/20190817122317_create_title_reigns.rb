class CreateTitleReigns < ActiveRecord::Migration[5.1]
  def change
    create_table :title_reigns do |t|
      t.date :start_date
      t.date :end_date
      t.references :performer, foreign_key: true
      t.references :championship, foreign_key: true
      t.boolean :is_current, default: false

      t.timestamps
    end
  end
end
