class AddVenueIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :venue_id, :integer
  end

  def self.down
    remove_column :posts, :venue_id
  end
end
