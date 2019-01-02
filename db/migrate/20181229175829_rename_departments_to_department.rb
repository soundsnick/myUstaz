class RenameDepartmentsToDepartment < ActiveRecord::Migration[5.1]
  def change
    rename_table :departments, :department
  end
end
