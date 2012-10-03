var availableTags;

function ConfigureTextBoxDefaults()
{
    var defaults = {};
    defaults['score'] = 'XX';
    defaults['studentName'] = "Type Student Name";
    defaults['assignmentName'] = "Type Assignment Name";
    defaults['courseName'] = "Type Course Name";

    $('input[type=text]').focus(function() {
        var id = $(this).attr("id");
        if($(this).val() == defaults[id])
            $(this).val("");
    });
    $('input[type=text]').blur(function() {
        var id = $(this).attr("id");
        if($(this).val() == "")
            $(this).val(defaults[id]);
    });

}
function ConfigureAutoComplete()
{
    availableTags=[];
    var $studentName = $( "#studentName" );
    $studentName.autocomplete( "destroy" );
    $.each($("#UngradedTable tr td"), function(i, td) {
        availableTags.push({label: $(td).find('span').html().trim(), value: $(td).find('input').val()});
    });
    if(availableTags.length > 0)
    {
        $( "#studentName" ).autocomplete({
            autoFocus: true,
            delay: 0,
            source: availableTags,
            select: function(event, ui) {
                $('#studentId').val(ui.item.value);
                $(event.target).val(ui.item.label);
                return false;
            }
        });
    }
}

function SetDonePercentage()
{
    var doneCount = $(".GradedStudent").length;
    var undoneCount = $(".UngradedStudent").length;
    if((undoneCount+doneCount) == 0)
        return;
    var percentComplete = Math.round((100*doneCount)/((undoneCount+doneCount)));
    $("#completion").html(percentComplete + "% Complete");
}

function MoveStudentToGradedTable()
{
    var $studentName = $('#studentName').val();
    var score = $('#score').val();
    var $oldStudentTD = $('#UngradedTable tr td').find(':contains("'+ $studentName +'")');
    var $new;
    var startOffset;

    if($oldStudentTD.length != 0) {
        $old = $oldStudentTD.parent().parent();
        $new = $old.clone().appendTo('#GradedTable');
        startOffset = $old.offset();
        $old.remove();
    }
    else {
        $new = $("<tr><td><span>"+ $studentName+ "</span></td></tr>").appendTo('#GradedTable');
        startOffset = $('#studentName').offset();
    }
    var endOffset = $new.offset();
    var $temp = $new.clone().appendTo('body');
    $new.hide();

    $temp
        .css('position', 'absolute')
        .css('left', startOffset.left)
        .css('top', startOffset.top)
        .css('zIndex', 1000);

    $new.removeClass("UngradedStudent");
    $new.addClass("GradedStudent");
    $new.append("<td>"+ score +"</td>");

    $temp.animate( {'top': endOffset.top, 'left':endOffset.left}, 'slow', function(){
        //callback function, we remove $old and $temp and show $new
        $new.show();
        $temp.remove();
        ConfigureAutoComplete();
        SetDonePercentage();
    });
}

$(document).ready(function() {
    ConfigureAutoComplete();
    SetDonePercentage();
    ConfigureTextBoxDefaults();
});

$(function() {
    $("#score").keyup(function(event){
        if(event.keyCode == 13){
            MoveStudentToGradedTable();
            $('#score').val("");
            $('#studentName').focus().val("");
        }
    });
});


$(function() {
    $('select[name="course_select"]').change( function() {
        if($(this).val() == 0)
        {
            window.location='/assignments/new';
        }
        else
        {
            window.location='/courses/' + $(this).val();
        }

    });
    $('select[name="assignment_select"]').change( function() {
        if($(this).val() == 0)
        {
            window.location='/assignments/new';
        }
        else
        {
            window.location='/assignments/' + $(this).val();
        }

    });
});

$(function() {
    $("#tryit").click(function(){
        $("#overlay").html();
    });
});