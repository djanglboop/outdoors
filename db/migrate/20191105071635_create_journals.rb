class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :title
      t.string :subtitle
      t.string :image_url
      t.text :description
      t.string :image
      t.string :smalltitle_01
      t.text :description_01
      t.string :image_01
      t.string :smalltitle_02
      t.text :description_02
      t.string :image_02
      t.string :smalltitle_03
      t.text :description_03
      t.string :image_03
      t.string :smalltitle_04
      t.text :description_04
      t.string :image_04
      t.string :smalltitle_05
      t.text :description_05
      t.string :image_05

      t.timestamps
    end
  end
end