class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :path
      t.timestamps
    end
  end
end
