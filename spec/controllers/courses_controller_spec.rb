require 'spec_helper'

describe CoursesController do

  describe "GET 'show'" do
    it "returns http success" do
      @course = Course.create!
      get 'show', :id => @course
      response.should be_success
    end

    # it "returns students in course" do
    #   @course = Course.create!(:name => "Biology 101")
    #   @course.students.new(:last_name => "Sacamano")
    #   @course.save!
    #   get 'show', :id => @course
    #   assigns(:students)
    # end
  end



  describe "GET 'create'" do
    it "returns http success" do
      post 'create', :course => {:name => "iOS 101"}
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "#edit" do 
    it  "edits a course" do
      @course = Course.create!(:name => "Math")
      get :edit, :id => @course
    end
  end

end
