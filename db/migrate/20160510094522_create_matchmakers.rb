class CreateMatchmakers < ActiveRecord::Migration
  def change
    create_table :matchmakers do |t|
      t.integer :uid
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
