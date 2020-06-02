class CreateVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :vouchers do |t|
      t.integer :counter
      t.integer :price_cents
      t.references :teacher, index: true, foreign_key: { to_table: :users}
      t.references :student, index: true, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
