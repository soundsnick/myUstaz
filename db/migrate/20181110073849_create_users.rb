class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :adress
      t.integer :university_id
      t.integer :sex
      t.string :phone
      t.string :avatar
      t.integer :role
      t.timestamps
    end
  end
end
