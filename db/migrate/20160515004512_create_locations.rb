class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.text :street
      t.text :city
      t.text :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
