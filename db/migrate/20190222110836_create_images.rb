class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image
      #t.string :path
      t.timestamps
    end
  end
end
