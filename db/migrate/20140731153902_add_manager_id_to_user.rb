class AddManagerIdToUser < ActiveRecord::Migration
  def change
  	add_column(:users, :managerId, :integer)
  end
end
