class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.location_of_jobs_counter
    joins(:jobs).group(:city).order('count_id desc').count('id')
  end

end
