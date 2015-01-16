class AddTrendIdToSubmission < ActiveRecord::Migration
  def change
  	add_column :submissions, :trend_id, :int
  end
end
