class StudentsController < ApplicationController
  def new
  	@student = Student.new
  end

  def create
  	@student = Student.new(params[:student])
  	@student.save!
  	redirect_to course_url(params[:student][:course_id])
  end

  def index
  	render :json => Student.all
  end
end
