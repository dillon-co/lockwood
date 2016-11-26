class AddSummaryToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :small_summary, :string
  end
end
