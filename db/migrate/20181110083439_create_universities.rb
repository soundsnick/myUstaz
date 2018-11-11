class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :adress
      t.string :phone
      t.string :email
      t.timestamps
    end
  end
end
