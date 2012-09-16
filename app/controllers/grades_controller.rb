class GradesController < ApplicationController
  def create
    student = params[:grade][:student]

    @grade = Grade.new
    #create the student if the student name is nil
    if student[:id].present?
      @grade.student = Student.find student[:id]
    else
      @grade.student = Student.create!({:name => student[:name]})
    end
    @grade.save!
    render :json => @grade
  end
end
