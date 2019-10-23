class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer, null: false, default: 0
    add_column :users, :admin_id, :integer
  end
end
