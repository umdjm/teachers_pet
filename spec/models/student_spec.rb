require 'spec_helper'

describe Student do
	@student = Student.new :name => "Bob Sacamano"
    @student.save
    @student.grades.new :assignment_id => 1, :student_id => 1, :score => 10
    @student.save
    @student.grades.count.should == 1
end
