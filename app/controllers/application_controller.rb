require './config/environment'
require './app/models/user'

class ApplicationController < Sinatra::Base

    configure do 
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'secret'
    end

    #Root Route
    get '/' do 
        erb :index
    end

    #Helper Methods
    helpers do 
        def current_user
            @user = User.first
        end
    end
end