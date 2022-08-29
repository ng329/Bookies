class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.text :blurb
      t.string :genre
      t.float :price_per_day
      t.string :author
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
