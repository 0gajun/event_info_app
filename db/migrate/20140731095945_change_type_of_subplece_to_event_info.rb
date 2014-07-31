class ChangeTypeOfSubpleceToEventInfo < ActiveRecord::Migration
  def change
  	remove_column(:event_infos, :sub_placeid)
  	add_column(:event_infos, :subplace, :integer)
  end
end
