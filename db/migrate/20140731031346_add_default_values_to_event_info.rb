class AddDefaultValuesToEventInfo < ActiveRecord::Migration
  def change
  	change_column_default(:event_infos, :pending_approval, false)
  	change_column_default(:event_infos, :reject_status, false)
  end
end
