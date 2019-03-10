class CreateIllustrationTags < ActiveRecord::Migration[5.2]
  def change
    create_table :illustration_tags do |t|
      t.references :illustration, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
