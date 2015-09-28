class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :funding_goal
      t.timestamps null: false # this adds 'created_at' and 'updated_at'
    end
  end
end
