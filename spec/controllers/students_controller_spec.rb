require 'spec_helper'

describe StudentsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      course = Course.create!
      post 'create', :student => {:name => "Scott Radcliff", :course_id => course.id}
      response.should redirect_to(course_url(course))
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
