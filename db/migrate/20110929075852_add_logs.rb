class AddLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.datetime :time
      t.string :card_num
      t.text :entry
      t.timestamps
    end
  end
end
