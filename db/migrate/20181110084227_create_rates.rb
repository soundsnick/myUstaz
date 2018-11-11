class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :category_id
      t.integer :user_id
      t.integer :value
      t.timestamps
    end
  end
end
