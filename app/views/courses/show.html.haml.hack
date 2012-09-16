

.page-header
  .container
    .row
      .span12
        %h1= @course.name

    .row
      .span9

        .form-inline
          = form_for @student do |f|
            = f.label "Student"
            = f.text_field :name, :id => "studentName"

            = f.label "Score"
            = f.text_field :email, :id => "score"

            = hidden_field(:student, :course_id, :value => @course.id)

      .span3
        <div id="completion">0% Complete</div>
.main
  .container
    .row
      .span3
        %h4 Ungraded
        %table.table.table-bordered#UngradedTable
          <tr><th>Students</th></tr>
          - @course.students.each do |student|
            %tr
              %td.ungradedStudent
                = student.name

      .span6
        %h4 Graded
        %table.table.table-bordered#GradedTable
          <tr><th>Students</th><th>Grades</th></tr>
