class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :thing
      t.string :description
      t.boolean :status
      t.datetime :complete_date

      t.timestamps null: false
    end
  end
end
