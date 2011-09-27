class CreateMembersProducts < ActiveRecord::Migration
  def change
    create_table :members_products, :id => false do |t|
      t.integer :member_id
      t.integer :product_id

      t.timestamps
    end
  end
end
