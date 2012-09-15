class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    if params[:course][:id].present?
      #TODO: Update the course
    else
      @course = Course.new params[:course]
      @course.save
      render :json => @course
    end
  end

  def show
    @course = Course.find(params[:id])
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

  def landing
  end
end
