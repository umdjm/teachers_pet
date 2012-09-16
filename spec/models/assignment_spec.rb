require 'spec_helper'

describe Assignment do
  it "add a new assignment to the course" do
    @assignment = Assignment.new :name => "Assignment 1" 
    @assignment.save
  end
end
