class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.level_of_interest_maker
    grouped = group(:level_of_interest).count
    grouped.map do |interest, count|
      "There are #{count} jobs with #{interest} interest level"
    end
  end

  def self.sorted_by_interest_level
    grouped = group(:company_id).average(:level_of_interest)
    grouped.sort_by do |interest, count|
      count
    end.reverse
  end

  def self.top_three_interest_level_companies
    top_three = sorted_by_interest_level.map do |key, value|
      company = Company.find(key)
      "#{company.name} Average interest level is #{value.to_f.round(2)}"
    end
    top_three[0..2]
  end


#   def self.location_companies
#     grouped_comp = Company.all.group(:city).count
#
#     grouped_comp.map do |key, count|
#       company = Company.find(key)
#       "There are #{count} jobs in #{city}"
#     end
#   end
# end


end
