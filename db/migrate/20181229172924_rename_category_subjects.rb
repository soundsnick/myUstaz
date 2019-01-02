class RenameCategorySubjects < ActiveRecord::Migration[5.1]
  def change
    rename_table :category_subjects, :departments
    rename_column :teachers, :subject_id, :department_id
    rename_column :subjects, :category_subject_id, :teacher_id
    drop_table :rates
    rename_table :costs, :rates
  end
end
