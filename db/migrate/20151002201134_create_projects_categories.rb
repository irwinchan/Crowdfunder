class CreateProjectsCategories < ActiveRecord::Migration
  def change
    create_table :categories_projects do |t|
      t.belongs_to :project, index: true
      t.belongs_to :category, index: true
    end
  end
end
