class AddDefaultToUsersDeactivated < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :deactivated, false
  end
end
