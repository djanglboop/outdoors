class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title
      t.string :subtitle
      t.string :image_url
      t.text :description
      t.string :smalltitle
      t.text :destination

      t.timestamps
    end
  end
end
