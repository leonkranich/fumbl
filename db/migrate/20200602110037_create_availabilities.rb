class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.date :day
      t.references :teacher, index: true, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
