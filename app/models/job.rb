class Job < ActiveRecord::Base
    belongs_to :user

    def self.valid?(params)
        return !params[:title].empty? && !params[:description].empty? && !params[:release_date].empty? && !params[:employer].empty? && !params[:location].empty? && !params[:job_type].empty?
    end
    
    validates :title, presence: true
    validates :description, presence: true
    validates :release_date, presence: true
    validates :employer, presence: true
    validates :location, presence: true
    validates :job_type, presence: true
end