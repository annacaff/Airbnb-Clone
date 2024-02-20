class AddOwnerIdToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :owner_id, :integer
  end
end
