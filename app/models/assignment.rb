class Assignment < ActiveRecord::Base
  attr_accessible :course_id, :name, :total_score

  has_many :grades

  def self.default
    assignment = Assignment.last
    if assignment.nil?
      assignment = Assignment.new

      course = Course.last
      if course.nil?
        course = Course.create!({:name => 'Biology 104'})
      end
      assignment.course_id = course.id
      assignment.name = 'Assignment #1'
    end
    assignment
  end
end
