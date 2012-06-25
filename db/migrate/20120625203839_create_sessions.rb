class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :uuid
      t.timestamp :last_seen_at

      t.timestamps
    end
  end
end
