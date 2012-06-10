before '/*.json' do
  content_type 'application/json'
end

get '/' do
  @title = Conf['title']
  haml :index
end

get '*.jpg' do
  @word = params[:splat].first
  begin
    img = Tiqav.search(@word).choice
    redirect img.url.to_s
  rescue => e
    STDERR.puts e
    status 500
    @mes = e.to_s
  end
end
