class CreateIllustrationCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :illustration_categories do |t|
      t.references :illustration, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
