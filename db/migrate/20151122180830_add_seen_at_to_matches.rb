class AddSeenAtToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :seen_at, :timestamp, default: nil
  end
end
