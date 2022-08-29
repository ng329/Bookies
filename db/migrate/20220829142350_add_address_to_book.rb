class AddAddressToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :address, :text
  end
end
