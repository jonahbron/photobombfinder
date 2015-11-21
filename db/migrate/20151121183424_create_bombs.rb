class CreateBombs < ActiveRecord::Migration
  def change
    create_table :bombs do |t|
      t.integer :user_id, :null => false, :references => [:user, :id]
      t.decimal :latitude, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.timestamp :taken_at
      t.timestamps null: false
    end
  end
end
