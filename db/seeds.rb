# db/seeds.rb

return unless ENV["ADMIN_EMAIL"] && ENV["ADMIN_PASSWORD"]

admin = Account.find_or_initialize_by(email: ENV["ADMIN_EMAIL"])

if admin.new_record?
    admin.password = ENV["ADMIN_PASSWORD"]
    admin.password_confirmation = ENV["ADMIN_PASSWORD"]
    admin.admin = true
    admin.save!
    Rails.logger.info "✅ Admin created: #{admin.email}"
end
