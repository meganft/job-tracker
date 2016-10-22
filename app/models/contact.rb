class Contact < ActiveRecord::Base
  validates :full_name, presence: true, uniqueness: true
  validates :position, presence: true
  validates :email, presence: true, uniqueness: true
  belongs_to :company
end
