class AddUserToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :Tasks, :user_id, :integer, :null => false, :default => 1
  end
end
