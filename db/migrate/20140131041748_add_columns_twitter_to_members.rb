class AddColumnsTwitterToMembers < ActiveRecord::Migration
  def change
  	add_column :users, :twitter, :string
  	add_column :users, :github, :string
  	add_column :users, :gplus, :string
  	add_column :users, :linkedin, :string
  end
end
