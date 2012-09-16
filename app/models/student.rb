class Student < ActiveRecord::Base
  attr_accessible :name, :email, :course_id

  has_many :grades
  belongs_to :course
end
