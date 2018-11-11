class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :surname
      t.string :avatar
      t.integer :university_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
