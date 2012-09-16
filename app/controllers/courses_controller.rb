class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    if params[:course][:id].present?
      update
    else
      @course = Course.new params[:course]
      @course.save
      render :json => @course
    end
  end

  def show
    @course = Course.find(params[:id])
    @grade = Grade.new
    @grade.student = Student.new
    @grade.assignment = Assignment.new({ :course_id => @course.id })
    @student = Student.new
  end

  def index
    @courses = Course.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update_attributes(params[:course])
    render :show
  end

end
