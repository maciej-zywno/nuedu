jQuery ->
  $(document).on 'click', '.f-video-upload-button', (event) ->
    filename = $(this).parent('.f-video-upload').find('input[type=file]').val();
    if (filename.length != 0 )

    else
      event.preventDefault()
      alert("no file selected");
    