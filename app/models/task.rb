class Task < ActiveRecord::Base
	attr_accessible :todo_item, :completed, :priority, :deadline
	validates :todo_item, presence: true
	validates :priority, presence: true
	belongs_to :project

	default_scope order('priority DESC')
end
