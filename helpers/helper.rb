
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
    case TmpCache.get("exists?_#{img.id}")
    when true
      return img
    when nil
      return img if TmpCache.set("exists?_#{img.id}", img.exists?, 60*30)
    end
  end
end
