class AddAttributesToPerformers < ActiveRecord::Migration[5.1]
  def change
    add_column :performers, :body_type, :string
    add_column :performers, :size, :integer
    add_column :performers, :strength, :integer
    add_column :performers, :agility, :integer
    add_column :performers, :gender, :string
    add_column :performers, :age, :integer
    add_column :performers, :wrestling_ability, :integer
    add_column :performers, :work_rate, :integer
    add_column :performers, :selling, :integer
  end
end
