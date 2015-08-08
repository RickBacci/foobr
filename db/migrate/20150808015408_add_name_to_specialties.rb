class AddNameToSpecialties < ActiveRecord::Migration
  def change
    add_column :specialties, :specialty_name, :string
  end
end
