class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :institution, :string
    add_column :users, :semester, :integer
  end
end
