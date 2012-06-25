class CreateConfessions < ActiveRecord::Migration
  def change
    create_table :confessions do |t|
      t.string :content

      t.timestamps
    end
  end
end
