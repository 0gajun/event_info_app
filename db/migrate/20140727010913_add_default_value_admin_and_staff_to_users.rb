class AddDefaultValueAdminAndStaffToUsers < ActiveRecord::Migration
  def change
  	change_column_default(:users, :admin, false)
  	change_column_default(:users, :staff, false)
  end
end
