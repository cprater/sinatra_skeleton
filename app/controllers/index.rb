get '/' do
  erb :index
end

get '/login' do 
	erb :login
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

#CREATE USER IS FUCKED UP
# post '/new/user' do 
# 	user = User.new(params[:user])

# 	if user.exists
# 		@found_user = true
# 		erb :register
# 	elsif user.save
# 		redirect "/profile/#{user.id}"
# 	else
# 		@bad_passsword = true
# 		erb :register
# 	end	
# end

