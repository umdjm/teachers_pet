class Assignment < ActiveRecord::Base
  attr_accessible :course_id, :name, :total_score

  has_many :grades
end
