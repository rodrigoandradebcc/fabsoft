$ ->

  # to set summernote object
  # You should change '#post_content' to your textarea input id
  summer_note = $('#about_content')

  summer_note.summernote
    # to set options
    height:300
    lang: 'pt-BR'
    toolbar: [
                ['insert', ['picture', 'link']],
                ["table", ["table"]],
                ["style", ["style"]],
                ["fontsize", ["fontsize"]],
                ["color", ["color"]],
                ["style", ["bold", "italic", "underline", "clear"]],
                ["para", ["ul", "ol", "paragraph"]],
                ["height", ["height"]],
                ["help", ["help"]]
             ]

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $('#product_description').code()
    summer_note.val summer_note.code()
    true