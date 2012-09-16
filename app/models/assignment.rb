class Assignment < ActiveRecord::Base
  attr_accessible :course_id, :name, :total_score

  belongs_to :course
  has_many :grades

  def self.default
    assignment = Assignment.last
    if assignment.nil?
      assignment = Assignment.new
      assignment.course_id = Course.default.id
      assignment.name = 'Assignment #1'
      assignment.save!
    end
    assignment
  end
end
