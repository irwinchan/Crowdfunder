class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :name
      t.text :description
      t.integer :backer_limit
      t.integer :project_id
      t.belongs_to :project
      t.timestamps null: false
    end
  end
end
