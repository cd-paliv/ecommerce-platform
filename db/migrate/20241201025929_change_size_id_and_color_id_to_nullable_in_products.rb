class ChangeSizeIdAndColorIdToNullableInProducts < ActiveRecord::Migration[8.0]
  def change
    change_column_null :products, :size_id, true
    change_column_null :products, :color_id, true
  end
end
