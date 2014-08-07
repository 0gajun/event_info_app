class AddFlagsToUpdatesEventinfos < ActiveRecord::Migration
  def change
  	add_column(:updates_eventinfos, :new, :boolean)
  	add_column(:updates_eventinfos, :update, :boolean)
  	add_column(:updates_eventinfos, :delete, :boolean)
  end
end
