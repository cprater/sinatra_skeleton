get '/' do
  erb :index
end

get '/login' do 
	erb :login
end

get '/list_users' do
	content_type :json
	@user_names = []
	User.all.each{|user| @user_names << user.name}
	@user_names.to_json
end

get '/new/user' do 
	erb :register
end

get '/profile/:user_id' do 
	@user = User.find(params[:user_id])
	erb :profile
end

#POST===========================================

post '/logout' do
	session[:current_user] = nil
end

post '/login' do
	user = User.find_by_name(params[:name])

	if user.authenticate(params[:password])
		session[:current_user] = user.id
		redirect "/profile/#{user.id}"
	else
		@errors = true
		erb :login
	end
end


post '/new/user' do 
	user = User.new(params[:user])

	if user.save
		@found_user = true
		erb :register
	elsif user.save
		redirect "/profile/#{user.id}"
	else
		@bad_passsword = true
		erb :register
	end	
end

