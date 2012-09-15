class Student < ActiveRecord::Base
  attr_accessible :name, :email, :course_id

  belongs_to :course
end
