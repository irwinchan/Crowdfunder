class Project < ActiveRecord::Base
  # belongs_to :user
  has_many :rewards
  # has_many :pledges
  # has_many :users, through :pledges
  # has_many :pledges, through :rewards
end
