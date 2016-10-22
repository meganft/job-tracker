class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.location_companies
    grouped = group(:city).count
    grouped.map do |city, count|
      "There are #{count} jobs in #{city}"
    end
  end
end
