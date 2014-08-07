class CreateCurrentRevisions < ActiveRecord::Migration
  def change
    create_table :current_revisions do |t|
      t.string :table_name
      t.integer :revision

      t.timestamps
    end
  end
end
