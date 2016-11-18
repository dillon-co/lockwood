class AddColumnToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :summary, :string
  end
end
