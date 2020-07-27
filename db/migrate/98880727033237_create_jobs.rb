class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |job|
      job.string :title
      job.string :description
      job.date :release_date
      job.string :employer
      job.string :location
      job.string :type
    end
  end
end
