class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :member_count
      t.integer :album_count
      t.boolean :actively_touring
      t.timestamps
    end
  end
end
