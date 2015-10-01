class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
  has_many :users, through: :pledges
  has_many :pledges, through: :rewards
end
