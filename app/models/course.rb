# frozen_string_literal: true

class Course < ApplicationRecord
  validates :day_length, presence: true
  validates :course_id, uniqueness: true, length: { maximum: 20, too_long: "%{count} characters is the maximum allowed" }
  validates :course_title, presence: true, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :topic, presence: true, length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  validates :category, presence: true, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }, length: { maximum: 40, too_long: "%{count} characters is the maximum allowed" }
  validates :level_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 }
  self.table_name = 'course' # use existing table
end
