class TeacherSubjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :subjects, :teacher_id
    create_table :teachers_subjects do |t|
      t.integer :teacher_id
      t.integer :subject_id
    end
  end
end
