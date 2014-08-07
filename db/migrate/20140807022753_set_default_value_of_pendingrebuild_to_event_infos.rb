class SetDefaultValueOfPendingrebuildToEventInfos < ActiveRecord::Migration
  def change
  	change_column_default(:event_infos, :pending_rebuild, :true)
  end
end
