class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :business_type
      t.string :name
      t.decimal :lat, :precision=>10, :scale=>6
      t.decimal :lng, :precision=>10, :scale=>6
      t.integer :rating
      t.string :url
      t.time :opening_time
      t.time :closing_time
      t.string :postcode
      t.string :street_name
      t.integer :building_number
      t.timestamps
    end
  end
end
