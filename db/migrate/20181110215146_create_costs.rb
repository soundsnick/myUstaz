class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :costs do |t|
      t.integer :teacher_id
      t.integer :user_id
      t.integer :value
      t.timestamps
    end
  end
end
