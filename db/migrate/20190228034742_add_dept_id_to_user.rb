class AddDeptIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dept_id, :bigint
  end
end
