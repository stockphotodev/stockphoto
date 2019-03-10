class CreateImageCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :image_categories do |t|
      t.references :image, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
