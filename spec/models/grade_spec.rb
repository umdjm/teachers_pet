require 'spec_helper'

describe Grade do
  it "add a grade to a student assignment" do
  	@grade = Grade.new :assignment_id => 1, :student_id => 1, :score => 10
    @grade.save
  end
end
