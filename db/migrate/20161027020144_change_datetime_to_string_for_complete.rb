class ChangeDatetimeToStringForComplete < ActiveRecord::Migration
  def change
    change_column(:tasks, :complete_date, :string)
  end
end
