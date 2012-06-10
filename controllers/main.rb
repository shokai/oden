before '/*.json' do
  content_type 'application/json'
end

get '/' do
  @title = 'Oden'
  haml :index
end

get '/:word.jpg' do
  @word = params[:word]
  begin
    imgs = TmpCache.get(@word) || TmpCache.set(@word, Tiqav.search(@word), 60*60*6)
    img = sample_exists_image(imgs)
    redirect img ? img.url.to_s : no_image
  rescue => e
    STDERR.puts e
    throw(:halt, [500, e.to_s])
  end
end
