class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.integer :amount

      t.timestamps null: false
    end
  end
end
