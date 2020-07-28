class UsersController < ApplicationController
    #index action
    get '/users' do 
        #@user = User.find(session[:user_id])
        erb :'users/index'
    end

    #User Signup
    get '/users/signup' do
        erb :'users/signup'
    end

    post '/signup' do 
        @user = User.new(username: params["username"], email: params["email"], password: params["password"])
        @user.save

        session[:user_id] = @user.id
        redirect '/users'
    end

    #User login

    get '/users/login' do 
        erb :'users/login'
    end

    post '/login' do 
        @user = User.find_by(username: params["username"])
        if @user
            session[:user_id] = @user.id
            redirect '/users'
        else
            redirect '/users/login'
        end
    end
    
    
end