class ChangePlantIdToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :plant_id, :booking_id
  end
end
