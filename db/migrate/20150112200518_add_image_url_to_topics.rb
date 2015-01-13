class AddImageUrlToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :imageURL, :string
  end
end
