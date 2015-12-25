class CreateDateSells < ActiveRecord::Migration
  def change
    create_table :date_sells do |t|
      t.date :goal_date
      t.date :input_date

      t.timestamps null: false
    end
  end
end
