class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :confessions, :content, :text, :limit => 2000
  	change_column :comments, :content, :text, :limit => 2000
  end
  def up
  end

  def down
  end
end
