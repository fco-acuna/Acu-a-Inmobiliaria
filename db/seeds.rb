admin_email = ENV["ADMIN_EMAIL"]

return unless admin_email

Account.find_or_create_by!(email: admin_email) do |admin|
    admin.first_name = ENV.fetch("ADMIN_FIRST_NAME", "Admin")
    admin.password = ENV["ADMIN_PASSWORD"]
    admin.admin = true
end
