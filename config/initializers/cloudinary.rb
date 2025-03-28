Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_URL'].split('/')[2]           # Extraire le cloud_name de l'URL
  config.api_key = ENV['CLOUDINARY_URL'].split(':')[1].split('@')[0] # Extraire l'api_key de l'URL
  config.api_secret = ENV['CLOUDINARY_URL'].split(':')[2]            # Extraire l'api_secret de l'URL
end
