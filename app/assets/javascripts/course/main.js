$( document ).ready(function(){

    $( ".courses-sortable" ).sortable({
        placeholder: "course-box-sortable-placeholder"
    });
    $( ".courses-sortable" ).disableSelection();

    show_hide_options_box();

    // call initialization file
    if($id("fileselect")) {
        if (window.File && window.FileList && window.FileReader) {
            Init();
        }
    }

    $('#filedrag').bind('click', function(){
        $('#fileselect').click();
    });

    $('#date-from, #date-to, #display-time-from, #display-time-to, #published-date').datepicker({
        format: 'dd-mm-yyyy'
    });

    $('#time-from, #time-to').timepicker({
        minuteStep: 5,
        showInputs: false,
        disableFocus: true,
        showMeridian: false
    });


    $('#course-quiz').modal();
    $('#course-add-quiz').modal();




});

$( window ).ready(function(){

    CKEDITOR.replaceAll( 'cke' );

});


// getElementById
function $id(id) {
    return document.getElementById(id);
}

//
// output information
function Output(msg) {
    var m = $id("messages");
    m.innerHTML = msg + m.innerHTML;
}

// initialize
function Init() {

    var fileselect = $id("fileselect"),
        filedrag = $id("filedrag"),
        submitbutton = $id("submitbutton");

    // file select
    fileselect.addEventListener("change", FileSelectHandler, false);

    // is XHR2 available?
    var xhr = new XMLHttpRequest();
    if (xhr.upload) {

        // file drop
        filedrag.addEventListener("dragover", FileDragHover, false);
        filedrag.addEventListener("dragleave", FileDragHover, false);
        filedrag.addEventListener("drop", FileSelectHandler, false);
        filedrag.style.display = "block";

        // remove submit button
        submitbutton.style.display = "none";
    }

}

function FileDragHover(e) {
    e.stopPropagation();
    e.preventDefault();
    e.target.className = (e.type == "dragover" ? "hover" : "");
}

function setInfo(i, e) {
    $('#x').val(e.x1);
    $('#y').val(e.y1);
    $('#w').val(e.width);
    $('#h').val(e.height);
}
// file selection
function FileSelectHandler(e) {

    // cancel event and hover styling
    FileDragHover(e);

    // fetch FileList object
    var oFReader = new FileReader();
    oFReader.readAsDataURL(document.getElementById("fileselect").files[0]);

    oFReader.onload = function (oFREvent) {
        $('#uploadPreview').attr('src', oFREvent.target.result).fadeIn();
        activate_crop();

    };
    $('img#uploadPreview').imgAreaSelect({
        // set crop ratio (optional)
        aspectRatio: '1:1',
        onSelectEnd: setInfo
    });
    // process all File objects
/*    for (var i = 0, f; f = files[i]; i++) {
        ParseFile(f);
    }*/

}

function activate_crop() {
    $('.page').css('display', 'none');
    $('.dad-file-wrapper').css('display', 'block');
}


function ParseFile(file) {

    Output(
        "<p>File information: <strong>" + file.name +
            "</strong> type: <strong>" + file.type +
            "</strong> size: <strong>" + file.size +
            "</strong> bytes</p>"
    );

}


function show_hide_options_box() {

    $('.header-box-arrow').on('click', function(){
        var self = $(this);

        var first_content = self.parent().parent().find('.options-box-content');
        var is_static = first_content.hasClass('static-box');

        if(!is_static) {
            var is_open = first_content.hasClass('open');

            if(is_open)
            {
                first_content.removeClass('open');
                self.removeClass('arrow-down');
                self.addClass('arrow-left');
                first_content.slideUp(600);
            } else {
                first_content.addClass('open');
                self.removeClass('arrow-left');
                self.addClass('arrow-down');
                first_content.slideDown(600);
            }
        }
    });

}


