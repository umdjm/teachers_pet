class Grade < ActiveRecord::Base
  attr_accessible :assignment_id, :student_id, :score, :student, :assignment

  belongs_to :student
  belongs_to :assignment
end
