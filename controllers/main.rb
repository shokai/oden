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
    redirect imgs.sample.url.to_s
  rescue => e
    STDERR.puts e
    status 500
    @mes = e.to_s
  end
end
