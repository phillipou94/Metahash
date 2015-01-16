class AddIsadminAndIseditorToUser < ActiveRecord::Migration
  def change
  	add_column :users, :is_admin, :boolean, default: false
  	add_column :users, :is_editor, :boolean, default: false
  end
end
