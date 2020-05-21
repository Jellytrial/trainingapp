class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :course_title
      t.string :topic
      t.integer :day_length
      t.integer :price
      t.integer :level_id
      t.string :category

      t.timestamps
    end
  end
end
