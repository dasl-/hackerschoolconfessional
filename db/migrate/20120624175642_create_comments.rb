class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :confession_id

      t.timestamps
    end
  end
end
