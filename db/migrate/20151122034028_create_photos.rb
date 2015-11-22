class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.integer :accuracy
      t.timestamp :taken_at

      t.timestamps null: false
    end
  end
end
