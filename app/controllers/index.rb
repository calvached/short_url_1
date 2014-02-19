get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  url = Url.create(url: params[:url])

  # url = Ur.new(url: params[:url])
  # url will be an object with a url property on it
  # url.url works
  # before save the callback will run
  # url will now have short_url
  # url.save
  # url is saved to db | url is persisted

  redirect "/generated/#{url.short_url}"
end

get '/generated/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  @sh_url = url.short_url
  erb :generated
end



get '/:some_url' do
  p params
  url = Url.find_by(short_url: params[:some_url])
  redirect "http://#{url.url}"
    # Get previous counter number and add our new counter
# url[:url]
# url[:click_count] == 0
#     @counter =+ 1
# url.update(click_count: 2)
end
