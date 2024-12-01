class AddDefaultStatusToSales < ActiveRecord::Migration[8.0]
  def change
    change_column_default :sales, :status, "pending"
  end
end
