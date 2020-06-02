class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :price_per_hours, :integer
    add_column :users, :teacher, :boolean
    add_column :users, :description, :text
    add_column :users, :address, :string
    add_column :users, :name, :string
  end
end
