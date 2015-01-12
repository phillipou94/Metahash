class AddTopicReferencesToSubmissions < ActiveRecord::Migration
  def change
    add_reference :submissions, :topic, index: true
    add_foreign_key :submissions, :topics
  end
end
