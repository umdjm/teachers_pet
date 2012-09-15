require 'spec_helper'

describe Course do
  it "add a new student to the course" do
    @course = Course.new :name => "Biology 101" 
    @course.save
    @course.students.new :first_name => "Bob", :last_name => "Sacamano", :email => "bob@seinfeld.com"
    @course.save
    @course.students.count.should == 1
  end
end


