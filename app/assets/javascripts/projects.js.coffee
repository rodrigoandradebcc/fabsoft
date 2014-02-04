$ ->

  # to set summernote object
  # You should change '#post_content' to your textarea input id
  summer_note = $('#project_description')

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

jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
  update: (coords) =>
    $('#project_crop_x').val(coords.x)
    $('#project_crop_y').val(coords.y)
    $('#project_crop_w').val(coords.w)
    $('#project_crop_h').val(coords.h)
    @updatePreview(coords)
  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
