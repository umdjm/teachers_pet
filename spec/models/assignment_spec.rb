require 'spec_helper'

describe Assignment do
  it "add a new assignment to the course" do
    @assignment = Assignment.new :name => "Assignment 1"
    @assignment.save
  end

  describe 'default' do
    it "creates a new course if one doesn't exist" do
      assignment = Assignment.default
      Course.find(assignment.course_id).should_not be_nil
    end

    it "assigns the course if there is one already" do
      course = Course.create!({:name => 'Course #2'})
      assignment = Assignment.default
      assignment.course_id.should == course.id
    end

    it "defaults a name" do
      assignment = Assignment.default
      assignment.name.should_not be_empty
    end

    it "returns the last one if they are already created" do
      Assignment.create!({:name => 'Assignment #2'})
      expected = Assignment.create!({:name => 'Assignment #3'})
      assignment = Assignment.default
      assignment.should == expected
    end
  end
end
