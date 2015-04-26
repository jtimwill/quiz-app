class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :quizzes, :slug, :string
  end
end
