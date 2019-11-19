class AddColumnToRolesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :quotes, :string
  end
end
