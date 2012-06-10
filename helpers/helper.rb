
def app_root
  "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
end

def no_image
  "#{app_root}/no_image.jpg"
end

def sample_exists_image(images)
  loop do
    break if images.empty?
    img = images.delete_at(rand images.size)
    return img if img.exists?
  end
end
