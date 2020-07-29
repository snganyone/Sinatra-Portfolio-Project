class JobsController < ApplicationController

    #Index Action

    get '/jobs' do
        @jobs = Jobs.all
        erb :'jobs/index'
    end

    #New Action

    get '/jobs/new' do
        @jobs = Jobs.all
        erb :'jobs/new'
    end

    #Create Action

    post '/jobs' do 
        @jobs = Jobs.new(title: params["title"], description: params["desc"], release_date: params["date"], employer: params["employer"], location: params["location"], job_type: params["job_type"])
        @jobs.save
        redirect "/jobs/#{@jobs.id}"
    end

    #show action

    get '/jobs/:id' do 
        @jobs = Jobs.find_by_id(params[:id])
        erb :'jobs/show'
    end

end