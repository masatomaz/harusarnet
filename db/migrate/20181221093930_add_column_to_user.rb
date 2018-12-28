class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :integer, limit: 2
    add_column :users, :birthday, :date
    add_column :users, :profile, :text
    add_column :users, :profile_picture, :string
    add_column :users, :admin, :boolean
    add_column :users, :prefecture, :integer
  end
end
