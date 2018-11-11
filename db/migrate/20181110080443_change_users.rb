class ChangeUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :email
      t.string :password
    end
  end
end
