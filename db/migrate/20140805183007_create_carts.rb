class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :total, :default => 0
      t.boolean :submitted, :default => false
    end
  end
end
