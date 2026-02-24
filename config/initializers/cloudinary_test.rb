Rails.application.config.after_initialize do
  if Rails.env.production?
    Rails.logger.info "========================================="
    Rails.logger.info "CLOUDINARY CONFIG TEST:"
    Rails.logger.info "Cloud Name: #{ENV['CLOUDINARY_CLOUD_NAME'].present? ? 'SET' : 'MISSING'}"
    Rails.logger.info "API Key: #{ENV['CLOUDINARY_API_KEY'].present? ? 'SET' : 'MISSING'}"
    Rails.logger.info "API Secret: #{ENV['CLOUDINARY_API_SECRET'].present? ? 'SET' : 'MISSING'}"
    Rails.logger.info "Active Storage Service: #{Rails.configuration.active_storage.service}"
    Rails.logger.info "========================================="
  end
end