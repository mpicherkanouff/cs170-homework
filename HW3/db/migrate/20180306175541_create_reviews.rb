class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :potatoes
      t.string :comments
      t.references :movie
      t.references :movieuser, foreign_key: true

      t.timestamps
    end
  end
end
