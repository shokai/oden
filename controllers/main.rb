before '/*.json' do
  content_type 'application/json'
end

get '/' do
  @title = Conf['title']
  haml :index
end

get '/:word.jpg' do
  @word = params[:word]
  begin
    img = Tiqav.search(@word).sample
    redirect img.url.to_s
  rescue => e
    STDERR.puts e
    status 500
    @mes = e.to_s
  end
end
