class AssignmentsController < ApplicationController
  def edit
    @assignment = Assignment.find params[:id]
    @grade = Grade.new({:student => Student.new,
                        :assignment => @assignment})
  end
end
