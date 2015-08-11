class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :developer_id, :integer
    add_column :projects, :client_id, :integer
  end
end
