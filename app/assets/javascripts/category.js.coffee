jQuery -> 
  $("li.parent-list ul").hide() #hide the child lists
  $("li.parent-list i").click ->
    $(this).toggleClass "icon-caret-up" # toggle the font-awesome icon class on click
    $(this).next("ul").toggle() # toggle the visibility of the child list on click
    return


  # check-uncheck all
  $(document).on "change", "input[id=\"all\"]", ->
    $(".canine").prop "checked", @checked
    return


  # parent/child check-uncheck all
  $ ->
    $(".parent").on "click", ->
      $(this).closest("ul li").find(":checkbox").prop "checked", @checked
      return

    return
