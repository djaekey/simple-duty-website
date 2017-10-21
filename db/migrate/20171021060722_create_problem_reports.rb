class CreateProblemReports < ActiveRecord::Migration[5.1]
  def change
    create_table :problem_reports do |t|
      t.timestamp :date
      t.references :user, foreign_key: true
      t.integer :computer_number
      t.text :details
      t.string :status

      t.timestamps
    end
  end
end
