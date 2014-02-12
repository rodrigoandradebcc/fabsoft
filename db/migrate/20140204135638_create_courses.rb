class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :workload
      t.text :specification
      t.date :start_date
      t.date :end_date
      t.integer :maximum_capacity
      t.integer :minimum_capacity
      t.timestamps
    end
  end
end
