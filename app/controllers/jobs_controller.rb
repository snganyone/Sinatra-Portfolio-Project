class JobsController < ApplicationController

    #Index Action

    get '/jobs' do
        @jobs = current_user.jobs
        erb :'jobs/index'
    end

    #New Action

    get '/jobs/new' do
        erb :'jobs/new'
    end

    #Create Action

    post '/jobs' do 
        @jobs = Jobs.new(title: params["title"], description: params["desc"], release_date: params["date"], employer: params["employer"], location: params["location"], job_type: params["job_type"])
        @jobs.save
        current_user.jobs.build
        redirect "/jobs/#{@jobs.id}"
    end

    #Show action

    get '/jobs/:id' do 
        @jobs = Jobs.find_by_id(params[:id])
        erb :'jobs/show'
    end

    #Edit Action

    get '/jobs/:id/edit' do 
        @jobs = Jobs.find_by_id(params[:id])
        erb :'jobs/edit'
    end

    #Delete Action
    get '/jobs/:id' do 
        @jobs = Jobs.find_by_id(params[:id])
        @jobs.destroy
        redirect "/jobs/#{@jobs.id}"
    end

end