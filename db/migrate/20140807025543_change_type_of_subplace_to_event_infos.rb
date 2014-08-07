class ChangeTypeOfSubplaceToEventInfos < ActiveRecord::Migration
  def change
  	change_column(:event_infos, :subplace, :string)
  end
end
