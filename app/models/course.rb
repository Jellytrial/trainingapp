# frozen_string_literal: true

class Course < ApplicationRecord
  include Discard::Model
  default_scope -> { kept } # return all records without discarded records
  validates :day_length, presence: true
  validates :course_id, uniqueness: true, length: { maximum: 20, too_long: '%{count} characters is the maximum allowed' }
  validates :course_title, presence: true, length: { maximum: 50, too_long: '%{count} characters is the maximum allowed' }
  validates :topic, presence: true, length: { maximum: 100, too_long: '%{count} characters is the maximum allowed' }
  validates :category, presence: true, length: { maximum: 40, too_long: '%{count} characters is the maximum allowed' }
  validates :level_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999_999 }
  self.table_name = 'course' # use existing table
end

Course.all             # => Only kept Course
Course.kept            # => same to Course.all
Course.discarded       # => []
Course.with_discarded            # All course
Course.with_discarded.discarded  # Only discarded course

# discard
course = Course.first # => #<Course id: 1, ...>
course.discard        # => true
course.discard!       # => Discard::RecordNotDiscarded: Failed to discard the record
course.discarded?     # => true
course.kept?          # => false

Course.all             # => [#<Course id: 1, ...>]
Course.kept            # => []
Course.discarded       # => [#<Course id: 1, ...>]

# undiscard
course = Course.first # => #<Post id: 1, ...>
course.undiscard      # => true
course.undiscard!     # => Discard::RecordNotUndiscarded: Failed to undiscard the record
course.discarded_at   # => nil
