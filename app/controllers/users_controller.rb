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
        #@user = User.new(username: params["username"], email: params["email"], password: params["password"])
        @user = User.create(params)
        
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
        @user = User.find_by(email: params["email"])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            @error_message = 'invalid credentials'
            redirect '/users/login'
        end
    end

    #Show action
    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end


    #Delete User
    delete '/users/:id' do 
        @user = User.delete(params[:id])
        redirect '/'
    end
    
    #Logout User
    delete '/logout' do 
        session.clear
        redirect '/'
    end

    private

    def set_user
        @current_admin = current_user.jobs.find_by_id(params[:id])
    end
    
end