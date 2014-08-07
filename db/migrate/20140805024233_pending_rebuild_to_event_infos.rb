class PendingRebuildToEventInfos < ActiveRecord::Migration
  def change
  	add_column(:event_infos, :pending_rebuild, :boolean)
  end
end
