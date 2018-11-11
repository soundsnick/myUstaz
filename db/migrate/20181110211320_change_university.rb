class ChangeUniversity < ActiveRecord::Migration[5.1]
  def change
    change_table :universities do |t|
      t.string :image
    end
  end
end
