class AddStatusColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, :default => "not submitted"
  end
end
