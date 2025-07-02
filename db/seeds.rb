# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Company.create(name: "KPMG")
Company.create(name: "PWC")

User.create(email: "accountant@kpmg.com", password: "password", company_id: 4)
User.create(email: "manager@kpmg.com", password: "password", company_id: 4)
User.create(email: "eavesdropper@pwc.com", password: "password", company_id: 5)

LineItemDate.create(date: Date.current, quote_id: 7)
