class AddSubdepartmentIdToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :subdepartment_id, :bigint
  end
end
