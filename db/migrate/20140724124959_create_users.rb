class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userid
      t.string :name
      t.string :email
      t.string :group
      t.boolean :staff
      t.boolean :admin

      t.timestamps
    end
  end
end
