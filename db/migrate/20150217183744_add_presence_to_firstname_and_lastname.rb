class AddPresenceToFirstnameAndLastname < ActiveRecord::Migration
  def change
    change_column :users, :firstname, :string, null: false
    change_column :users, :lastname, :string, null: false
  end
end
