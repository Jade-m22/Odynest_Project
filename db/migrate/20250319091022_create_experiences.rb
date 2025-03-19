class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :location
      t.integer :duration
      t.datetime :start_date_1
      t.datetime :start_date_2
      t.datetime :start_date_3
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
