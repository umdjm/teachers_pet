require 'spec_helper'

describe Course do
  it "add a new student to the course" do
    @course = Course.new :name => "Biology 101" 
    @course.save
    @course.students.new :name => "Bob Sacamano", :email => "bob@seinfeld.com"
    @course.save
    @course.students.count.should == 1
  end
end


