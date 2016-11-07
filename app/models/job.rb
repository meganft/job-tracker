class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments
  has_many :jobs_tags
  has_many :tags, through: :jobs_tags

  def self.level_of_interest
     group(:level_of_interest).count
  end

  def self.sorted_by_interest_level
    grouped = group(:company_id).average(:level_of_interest)
    grouped.sort_by do |company, interest|
      interest
    end.reverse[0..2]
  end

end
