
$(document).bind('page:change', function() {
  $('input[type=file].f-attachment').bootstrapFileInput();
  return $("#s3-uploader").S3Uploader();

});
