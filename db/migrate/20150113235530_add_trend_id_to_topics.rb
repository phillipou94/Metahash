class AddTrendIdToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :trend_id, :int
  end
end
