require 'spec_helper'

describe GradesController do
  describe "POST 'create'" do

    before :each do
      course = Course.create!
      @assignment = Assignment.create!({ :course_id => course.id })
    end

    context "without a student" do
      it "returns http success" do
        post 'create', :grade => {
          :score => 97,
          :student => {:id => nil, :name => 'Jimmy Page'},
          :assignment => {:id => @assignment.id, :course_id => @assignment.course_id}}
        response.should be_success
      end

      it "creates the student with the specified name" do
        student_name = 'Homer Simpson'
        post 'create', :grade => {
          :score => 97,
          :student => {:id => nil, :name => student_name},
          :assignment => {:id => @assignment.id, :course_id => @assignment.course_id}}
        Student.find_by_name(student_name).should_not be_nil
      end
    end

    context "with a student" do

      before :each do
        @student = Student.create!({:name => 'Aaron Patterson'})
      end

      it "assign the student" do
        post 'create', :grade => {
          :score => 97,
          :student => {:id => @student.id, :name => @student.name},
          :assignment => {:id => @assignment.id, :course_id => @assignment.course_id}}
        grade = JSON.parse(response.body)
        Grade.find(grade['id']).student_id.should == @student.id
      end
    end
  end
end
