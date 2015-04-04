class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :type
      t.string :name
      t.decimal :lat, :precision=>10, :scale=>6
      t.decimal :lng, :precision=>10, :scale=>6
      t.string :url
      t.timestamps
    end
  end
end
