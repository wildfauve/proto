class AddRegistrationToMembers < ActiveRecord::Migration
  def change
    add_column :members, :registered, :boolean, :default => false
    add_column :members, :reg_date, :datetime
  end
end
