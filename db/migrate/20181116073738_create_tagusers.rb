class CreateTagusers < ActiveRecord::Migration[5.1]
  def change
    create_table :tagusers do |t|
      t.integer :user_id
      t.integer :teacher_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
