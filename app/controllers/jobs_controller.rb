class JobsController < ApplicationController

    #Index Action

    get '/jobs' do
        #@user_jobs = current_user.jobs
        @jobs = Job.all
        erb :'jobs/index'
    end

    #Jobs related to a Specific User

    get '/jobs/users' do 
        @user_jobs = current_user.jobs
        #session[:user_id] = @user_jobs.id
        erb :'jobs/users'
    end

    #New Action

    get '/jobs/new' do
        if logged_in?
            erb :'jobs/new'
            #binding.pry
        else
            redirect '/users/login'
        end
    end

    #Create Action

    post '/jobs' do 
        @jobs = Job.new(title: params["title"], description: params["desc"], release_date: params["date"], employer: params["employer"], location: params["location"], job_type: params["job_type"])
        #@jobs.user = current_user
        #@jobs = current_user.jobs.build(params)        

        if @jobs.save
            redirect "/jobs/#{@jobs.id}"
        else
            redirect "/users/new"
        end
    end

    #Show action

    get '/jobs/:id' do 
        #set_post
        @jobs = Job.find_by_id(params[:id])
        erb :'jobs/show'
    end

    #Edit Action

    get '/jobs/:id/edit' do 
        @jobs = Job.find_by_id(params[:id])
        erb :'jobs/edit'
    end

    patch '/jobs/:id' do 
        Job.update(params[:id], title: params["title"], description: params["desc"], release_date: params["date"], employer: params["employer"], location: params["location"], job_type: params["job_type"])
        @jobs = Job.find(params[:id])
        redirect "/jobs/#{@jobs.id}"
    end

    #Delete Action
    delete '/jobs/:id' do 
        @jobs = Job.find_by_id(params[:id])
        @jobs.destroy
        redirect "/jobs"
    end

    private

    def set_post
        @jobs = Job.find_by_id(params[:id])
    end

end