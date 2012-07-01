class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :confessions, :content, :text, :limit => nil
  	change_column :comments, :content, :text, :limit => nil
  end
  def up
  end

  def down
  end
end
