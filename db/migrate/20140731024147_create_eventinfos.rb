class CreateEventInfos < ActiveRecord::Migration
  def change
    create_table :event_infos do |t|
      t.string :title
      t.integer :placeid
      t.integer :sub_placeid
      t.integer :categoryid
      t.string :firstday_time
      t.string :secondday_time
      t.text :description
      t.string :image_url
      t.string :movie_url
      t.integer :userid
      t.boolean :pending_approval
      t.boolean :reject_status
      t.text :reject_message
      t.timestamp :modify_date

      t.timestamps
    end
  end
end
