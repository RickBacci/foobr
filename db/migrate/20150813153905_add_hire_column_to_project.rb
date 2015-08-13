class AddHireColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :hire, :string, array: true
  end
end
