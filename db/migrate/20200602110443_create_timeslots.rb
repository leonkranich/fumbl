class CreateTimeslots < ActiveRecord::Migration[6.0]
  def change
    create_table :timeslots do |t|
      t.datetime :start_time
      t.datetime :end_date
      t.boolean :booked, default: false
      t.references :availability, null: false, foreign_key: true
      t.references :student, index: true, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
