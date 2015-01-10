class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :summary
      t.text :trending_reason
      t.string :picture
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :topics, :users
    add_index :topics, [:user_id, :created_at]

  end
end
