class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.string :location
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end
