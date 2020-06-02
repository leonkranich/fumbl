class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :experience
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
