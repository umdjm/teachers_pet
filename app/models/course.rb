class Course < ActiveRecord::Base
  attr_accessible :name

  has_many :students
  has_many :assignments

  def self.default
    course = Course.last
    if course.nil?
      course = Course.create!({:name => 'Biology 104'})
    end
    course
  end
end
