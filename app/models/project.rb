class Project < ActiveRecord::Base
	attr_accessible :project_name
	validates :project_name, presence: true
	has_many :tasks
	belongs_to :user
end
