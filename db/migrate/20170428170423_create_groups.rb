class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
