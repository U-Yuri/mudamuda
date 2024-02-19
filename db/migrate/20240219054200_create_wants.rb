class CreateWants < ActiveRecord::Migration[7.0]
  def change
    create_table :wants do |t|
      t.string :name
      t.integer :money
      t.integer :year
      t.integer :month
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
