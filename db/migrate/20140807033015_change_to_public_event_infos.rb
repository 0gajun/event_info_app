class ChangeToPublicEventInfos < ActiveRecord::Migration
  def change
  	remove_column(:public_event_infos, :userid)
  	add_column(:public_event_infos, :group, :string)
  end
end
