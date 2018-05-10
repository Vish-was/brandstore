class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :seller, :boolean, default: true
    add_column :users, :name, :string
  end
end
