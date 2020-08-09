# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[role_1 role_2 admin].each do |role|
  name = "User with #{role}"

  User.find_or_create_by(name: name) do |user|
    user.email    = "#{role}@default.com"
    user.password = '#12345#'
    user.role     = role
  end
end
