# frozen_string_literal: true

json.extract! course, :id, :course_id, :course_title, :topic, :day_length, :price, :level_id, :category, :created_at, :updated_at
json.url course_url(course, format: :json)
