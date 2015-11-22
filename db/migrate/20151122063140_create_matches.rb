class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :bomb, index: true, foreign_key: true
      t.references :photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
