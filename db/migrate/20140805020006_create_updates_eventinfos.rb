class CreateUpdatesEventinfos < ActiveRecord::Migration
  def change
    create_table :updates_eventinfos do |t|
      t.integer :revision
      t.integer :event_id

      t.timestamps
    end
  end
end
