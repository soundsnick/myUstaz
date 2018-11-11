class CreateCommentaries < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaries do |t|
      t.integer :user_id
      t.text :text
      t.integer :status
      t.integer :teacher_id
      t.timestamps
    end
  end
end
