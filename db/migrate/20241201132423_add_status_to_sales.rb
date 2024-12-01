class AddStatusToSales < ActiveRecord::Migration[8.0]
  def change
    add_column :sales, :status, :string, default: "pending"
  end
end
