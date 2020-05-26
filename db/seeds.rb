require 'faker'
include Faker
# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
    Course.create([{
       course_id: Faker::Code.unique.nric,
       course_title: Faker::Educator.unique.course_name, 
       topic: Faker::Books::CultureSeries.culture_ship_class, 
       day_length: Faker::Number.within(range: 1..100), 
       price: Faker::Number.within(range: 0..999999), 
       level_id: Faker::Number.within(range: 1..5), 
       category: Faker::ProgrammingLanguage.name
    }])
end