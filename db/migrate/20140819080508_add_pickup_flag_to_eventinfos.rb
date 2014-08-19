class AddPickupFlagToEventinfos < ActiveRecord::Migration
  def change
  	add_column(:event_infos, :pickup, :boolean)
  	add_column(:public_event_infos, :pickup, :boolean)
  end
end
