class CreateSubplaces < ActiveRecord::Migration
  def change
    create_table :subplaces do |t|
      t.string :name

      t.timestamps
    end
  end
end
