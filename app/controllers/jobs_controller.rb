class JobsController < ApplicationController

    #index action
    get '/jobs' do
        @jobs = Jobs.all 
        erb :'jobs/index'
    end
end