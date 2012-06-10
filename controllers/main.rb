before '/*.json' do
  content_type 'application/json'
end

get '/' do
  @title = Conf['title']
  haml :index
end

get '*.jpg' do
  @word = params[:splat].first
  img = Tiqav.search(@word).choice
  redirect img.url.to_s
end
