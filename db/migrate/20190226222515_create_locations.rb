class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.text :name
      t.text :location

      t.timestamps
    end
    add_index :locations, :name, unique: true
    add_index :locations, :location, unique: true
  end
end
