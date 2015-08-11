class CreateUserSpecialties < ActiveRecord::Migration
  def change
    create_table :user_specialties do |t|
      t.references :user, index: true, foreign_key: true
      t.references :specialty, index: true, foreign_key: true
    end
  end
end
