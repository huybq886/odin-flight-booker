# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# 
# Examples:
# 
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tables = ApplicationRecord.connection.tables - ['schema_migrations']
# In PostgreSQL, it does not do this automatically. You can use TRUNCATE TABLE table RESTART IDENTITY;
# To automatically truncate all tables that have foreign-key references to any of the named tables use CASCADE.
# tables.each do |table|
#   ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE")
# end
tables.each do |table|
  ApplicationRecord.connection.execute("TRUNCATE #{table} RESTART IDENTITY")
end

airports = Airport.create([
  { code: 'SFO' },
  { code: 'NYC' }
])

flights = Flight.create([
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 320, scheduled_on: "2021-02-25 07:00:00"},
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 320, scheduled_on: "2021-02-25 09:00:00"},
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 320, scheduled_on: "2021-02-25 11:00:00"},
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 380, scheduled_on: "2021-02-26 07:00:00"},
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 380, scheduled_on: "2021-02-26 09:00:00"},
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 380, scheduled_on: "2021-02-26 11:00:00"}
])