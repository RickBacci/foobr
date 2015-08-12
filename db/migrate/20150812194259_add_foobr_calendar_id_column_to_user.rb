class AddFoobrCalendarIdColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :foobr_calendar_id, :string
  end
end
