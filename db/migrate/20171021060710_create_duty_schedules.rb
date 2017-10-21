class CreateDutySchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :duty_schedules do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
