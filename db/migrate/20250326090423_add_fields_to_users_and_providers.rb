class AddFieldsToUsersAndProviders < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :providers, :first_name, :string
    add_column :providers, :profile_picture, :string
  end
end
