class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
