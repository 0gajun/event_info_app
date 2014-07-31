class DeleteModifyDateToEventInfo < ActiveRecord::Migration
  def change
  	remove_column(:event_infos, :modify_date)
  end
end
