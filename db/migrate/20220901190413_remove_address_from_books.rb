class RemoveAddressFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :address
  end
end
