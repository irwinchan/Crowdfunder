class AddForeignKeysToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :user_id, :integer
    add_column :pledges, :reward_id, :integer
  end
end
