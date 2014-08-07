class CreatePublicEventInfos < ActiveRecord::Migration
  def change
    create_table :public_event_infos do |t|
      t.integer :event_id
      t.string :title
      t.integer :placeid
      t.integer :categoryid
      t.string :firstday_time
      t.string :secondday_time
      t.text :description
      t.string :image_url
      t.string :movie_url
      t.integer :userid
      t.string :subplace

      t.timestamps
    end
  end
end
