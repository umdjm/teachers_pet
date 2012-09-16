class Assignment < ActiveRecord::Base
  attr_accessible :course_id, :name, :total_points

  has_many :grades
end
