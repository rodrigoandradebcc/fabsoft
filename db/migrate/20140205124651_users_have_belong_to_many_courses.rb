class UsersHaveBelongToManyCourses < ActiveRecord::Migration
  def change
  	create_table :courses_users, id: false do |t|
  		t.references :course, :user
  	end
  end
end
