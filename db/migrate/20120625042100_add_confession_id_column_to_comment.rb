class AddConfessionIdColumnToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :confession_id, :integer
  end

  def self.down
    remove_column :comments, :user_id
  end

end
