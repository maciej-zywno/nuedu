jQuery ->
  $(document).on 'click', 'form .remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $(document).on 'click', 'form .add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $(document).on 'click', '.f-exam-upload-button', (event) ->
    event.preventDefault()
    $results = $('.f-exam-results')
    video_id = $results.data("video_id")
    step_id = $results.data("step_id")
    course_id = $results.data("course_id")
    exam_id = $results.data('exam')
    
    form = {}
    form['exam_id'] = exam_id
    form['questions'] = {}
    $results.find(".f-question").each (index) ->
      $question = $(this)
      question_id = $question.data("question")
      form['questions'][question_id]=[]
      $question.find(".f-answer").each (index) ->
        if @checked
          answer_id = $(this).data("answer")
          form['questions'][question_id].push answer_id

    data = "data='"+JSON.stringify(form)+"'"

    url = ""
    if video_id is ""
      url = "/courses/" + course_id + "/steps/" + step_id + "/exams/" + exam_id + "/finish"
    else
      url = "/courses/" + course_id + "/steps/" + step_id + "/videos/" + video_id + "/exams/" + exam_id + "/finish"

    $.ajax(
      type: "POST"
      url: url
      dataType: "script"
      data: data
    ).done(->
    ).fail(->
      alert "error"
      return
    ).always ->





