class Job < ActiveRecord::Base
    belongs_to :user
    
    validates :title, presence :true
    validates :description, presence :true
    validates :release_date, presence :true
    validates :employer, presence :true
    validates :location, presence :true
    validates :job_type, presence :true
end