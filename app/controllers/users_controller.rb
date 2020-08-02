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
        
        if @user.save
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/users/signup'
        end
    end

    #User login / Create Action

    get '/users/login' do 
        erb :'users/login'
    end

    post '/login' do 
        @user = User.find_by(username: params["username"])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/users/login'
        end
    end

    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end


    #Delete User
    delete '/users/:id' do 
        @user = User.delete(params[:id])
        redirect '/users'
    end
    
    #Logout User
    delete '/logout' do 
        session.clear
        redirect '/users/login'
    end
    
end