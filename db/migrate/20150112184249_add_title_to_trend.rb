class AddTitleToTrend < ActiveRecord::Migration
  def change
  	add_column :trends, :title, :string
  end
end
