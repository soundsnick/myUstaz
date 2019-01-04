class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
    end
    rename_column :users, :role, :role_id
  end
end
