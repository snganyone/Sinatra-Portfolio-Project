class UsersController < ApplicationController
    #index action
    get '/users' do 
        erb :'users/index'
    end

    #User Signup
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do 
    end

    #User login

    get '/login' do 
        erb :'users/login'
    end
    
    
end