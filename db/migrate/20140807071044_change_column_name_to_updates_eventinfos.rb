class ChangeColumnNameToUpdatesEventinfos < ActiveRecord::Migration
  def change
  	rename_column(:updates_eventinfos, :update, :update_flag)
  	rename_column(:updates_eventinfos, :new, :new_flag)
  	rename_column(:updates_eventinfos, :delete, :delete_flag)
  end
end
