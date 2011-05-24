class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :name
      t.string :contact
      t.datetime :rsvp_by
      t.datetime :date_of
      t.integer :category_id
      t.text :description
      t.timestamps 
    end
  end

  def self.down
    drop_table :posts
  end
end
