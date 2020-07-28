class JobsController < ApplicationController

    #index action
    get '/jobs' do
        @jobs = Jobs.all 
        erb :'jobs/index'
    end

    #create action

    get '/jobs/new' do
        @jobs = Jobs.all
        erb :'jobs/new'
    end

    post '/jobs' do 
    end

    #show action

    get '/jobs/:id' do 
        @jobs = Jobs.find_by_id(params[:id])
        erb :'jobs/show'
    end

end