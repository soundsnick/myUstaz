class RenameTeachersSubjects < ActiveRecord::Migration[5.1]
  def change
    rename_table :teachers_subjects, :subjects_teachers
  end
end
