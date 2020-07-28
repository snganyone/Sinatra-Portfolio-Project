class UsersController < ApplicationController
    get '/users/index' do 
        erb :'users/index'
    end
end