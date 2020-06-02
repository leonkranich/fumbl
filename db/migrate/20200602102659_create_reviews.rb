class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :teacher, index: true, foreign_key: { to_table: :users}
      t.references :student, index: true, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
