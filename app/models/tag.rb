class Tag < ActiveRecord::Base
  has_many :jobs_tags
  has_many :jobs, through: :jobs_tags

  def total_jobs
    jobs.count 
  end
end
