class IntegrateDlIntoUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :dl_username
      t.integer :role
      t.timestamps
    end
  end
end
