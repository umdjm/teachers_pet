class StudentsController < ApplicationController
  def new
  	@student = Student.new
  end

  def create
  end

  def index
  	render :json => Student.all
  end
end
