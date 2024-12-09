class AddClientIdToSales < ActiveRecord::Migration[8.0]
  def change
    add_column :sales, :client_id, :integer
  end
end
