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

        def correct_user?(user)
            user == current_user
        end

        def correct_user
            if params[:id] == session[:user_id]
                current_user || User.find_by(id: user_id)
            end
        end
    end

    def redirect_if_not_logged_in
        redirect '/' unless logged_in?
    end

end