require './config/environment'
require './app/models/user'

class ApplicationController < Sinatra::Base

    configure do 
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
    end

    #Root Route
    get '/' do 
        erb :index
    end

    #Helper Methods
    helpers do 
        def current_user
            @current_user = User.find_by_id(session[:user_id])
        end

        def logged_in?
            !!current_user
        end
    end

    private

    def set_user
        @current_admin = current_user.jobs.find_by_id(params[:id])
    end
end