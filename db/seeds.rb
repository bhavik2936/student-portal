# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Admin.find_or_create_by(email: ENV.fetch("ADMIN_DEFAULT_EMAIL")) do |admin_user|
  admin_user.first_name = "Portal"
  admin_user.last_name = "Admin"
  admin_user.password = ENV.fetch("ADMIN_DEFAULT_PASSWORD")
  admin_user.password_confirmation = ENV.fetch("ADMIN_DEFAULT_PASSWORD")
  admin_user.approved = true
end
