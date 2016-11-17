class AddCourseNoToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_no, :string
  end
end
