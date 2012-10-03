class AssignmentsController < ApplicationController
  def show

    @assignment = Assignment.find params[:id]
    @grade = Grade.new({:student => Student.new,
                        :assignment => @assignment})

    @course = @assignment.course
    @course_options = Course.all.map { |course| [course.name, course.id] }
    @course_options.push(["New Course",0])

    @assignment_options = @course.assignments.map { |assignment| [assignment.name, assignment.id] }
    @assignment_options.push(["New Assignment",0])

  end

  def new
    @assignment = Assignment.new
    @assignment.course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  def create
    @assignment = Assignment.new
    @assignment.name = params[:assignment][:name]
    @assignment.course = Course.new
    @assignment.course.name = params[:assignment][:course][:name]

    respond_to do |format|
      if @assignment.save!
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

end