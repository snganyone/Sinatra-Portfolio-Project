class UsersController < ApplicationController
    get '/users' do 
        erb :'users/index'
    end

    get '/login' do 
        erb :'users/login'
    end

    get '/signup' do
        erb :'users/signup'
    end
end