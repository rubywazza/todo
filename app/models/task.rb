class Task < ActiveRecord::Base
belongs_to :user
validates :title, presence: true, uniqueness: true
attr_accessible :title, :description, :deadline, :attachment, :is_finished
end
