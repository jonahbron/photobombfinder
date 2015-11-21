class AddAccuracyToBombs < ActiveRecord::Migration
  def change
    add_column :bombs, :accuracy, :integer
  end
end
