class UsersController < ApplicationController
    #index action
    get '/users' do 
        #@user = User.find(session[:user_id])
        erb :'users/index'
    end

    #User Signup / New Action
    get '/users/signup' do
        erb :'users/signup'
    end

    post '/signup' do 
        @user = User.new(username: params["username"], email: params["email"], password: params["password"])
        @user.save

        session[:user_id] = @user.id
        redirect '/users'
    end

    #User login / Create Action

    get '/users/login' do 
        erb :'users/login'
    end

    get '/users/:id' do 
        @user = User.find(params[:id])
        erb :'/users'
    end

    post '/login' do 
        @user = User.find_by(username: params["username"])
        if @user
            session[:user_id] = @user.id
            redirect '/users/'
        else
            redirect '/users/login'
        end
    end


    #Delete User
    delete '/users/:id' do 
        @user = User.delete(params[:id])
        redirect '/users'
    end
    
    #Logout User
    get '/logout' do 
        session.clear
        redirect '/'
    end
    
end