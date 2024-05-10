class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.datetime :clicked
      t.references :news, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_foreign_key :clicks, :news, on_delete: :cascade
  end
end
