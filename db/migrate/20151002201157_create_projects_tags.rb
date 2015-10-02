class CreateProjectsTags < ActiveRecord::Migration
  def change
    create_table :projects_tags do |t|
      t.integer :project_id
      t.integer :tag_id
    end
  end
end
