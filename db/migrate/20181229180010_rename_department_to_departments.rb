class RenameDepartmentToDepartments < ActiveRecord::Migration[5.1]
  def change
    rename_table :department, :departments
  end
end
