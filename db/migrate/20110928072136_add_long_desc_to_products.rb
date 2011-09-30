class AddLongDescToProducts < ActiveRecord::Migration
  def change
        add_column :products, :long_desc, :text
  end
end
