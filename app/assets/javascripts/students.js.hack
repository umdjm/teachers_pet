var availableTags = [];

$(document).ready(function() {

    $.each( $("#UngradedTable tr td"), function(i, td){
        availableTags.push($(td).html().trim());
      });
});

$(function() {
    $( "#studentName" ).autocomplete({
        autoFocus: true,
        delay: 0,
        source: availableTags
    });
});


$(function() {
    $("#score").keyup(function(event){
        if(event.keyCode == 13){
            var $studentName = $('#studentName').val();
            var score = $('#score').val();
            var $old = $('#UngradedTable tr').find(':contains("'+ $studentName +'")').parent();
            //First we copy the arrow to the new table cell and get the offset to the document
            var $new = $old.clone().appendTo('#GradedTable');
            var newOffset = $new.offset();
            var oldOffset = $old.offset();
            var $temp = $new.clone().appendTo('body');
            $new.hide();
            $old.hide();

            $temp
                .css('position', 'absolute')
                .css('left', oldOffset.left)
                .css('top', oldOffset.top)
                .css('zIndex', 1000);

            $temp.animate( {'top': newOffset.top, 'left':newOffset.left}, 'slow', function(){
                //callback function, we remove $old and $temp and show $new
                $new.append("<td>"+ score +"</td>");
                $new.show();
                $old.remove();
                $temp.remove();
            });
            $('#studentName').focus().val("");
            $('#score').val("");
            var index = availableTags.indexOf($studentName);
            availableTags.splice(index, 1);
            $( "#studentName" ).autocomplete({
                autoFocus: true,
                delay: 0,
                source: availableTags
            });

            var doneCount = $("#GradedTable tr").length - 1;
            var undoneCount = $("#UngradedTable tr").length - 1;
            var percentComplete = Math.round((100*doneCount)/((undoneCount+doneCount)));
            $("#completion").html(percentComplete + "% Complete");
        }
    });
});
