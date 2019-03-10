class CreateImageTags < ActiveRecord::Migration[5.2]
  def change
    create_table :image_tags do |t|
      t.references :image, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
