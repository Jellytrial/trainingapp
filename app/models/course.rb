# frozen_string_literal: true

class Course < ApplicationRecord
  validates :course_id, :course_title, :topic, :day_length, :level_id, :category, presence: true
  self.table_name = 'course' # use existing table
end
