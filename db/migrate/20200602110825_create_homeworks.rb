class CreateHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.text :description
      t.references :timeslot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
