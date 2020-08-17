class JobsController < ApplicationController

    #Index Action

    get '/jobs' do
        redirect_if_not_logged_in

        @jobs = Job.all
        erb :'jobs/index'
    end

    #Jobs related to a Specific User

    get '/jobs/:id/users' do 
        redirect_if_not_logged_in
        #@current_job = Job.find_by_id(params[:id])
        @user_jobs = current_user.jobs
        erb :'jobs/users'

    end

    #New Action

    get '/jobs/new' do
        redirect_if_not_logged_in
        erb :'jobs/new'
    end

    #Create Action

    post '/jobs' do 
        #@jobs = Job.new(title: params["title"], description: params["desc"], release_date: params["date"], employer: params["employer"], location: params["location"], job_type: params["job_type"])
        @job_postings = current_user.jobs.build(params)

        if Job.valid?(params)
            binding.pry
            @job_postings.save
            redirect "/jobs/#{@job_postings.id}"
        else
            redirect "/jobs/new"
        end
    end

    #Show action

    get '/jobs/:id' do 
        #set_post
        if logged_in? && correct_user
            @jobs = Job.find_by_id(params[:id])
            erb :'jobs/show'
        else
            redirect '/jobs'
        end
    end

    #Edit Action

    get '/jobs/:id/edit' do 
        if logged_in? && correct_user
            @jobs = Job.find_by_id(params[:id])
            erb :'jobs/edit'
        else
            redirect '/jobs'
            #binding.pry
        end
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

    def set_user
        @u = User.find_by(params[:id])
        #@current_job = current_user.jobs.find_by_id(session[:id])
        current_user == @u
    end

end