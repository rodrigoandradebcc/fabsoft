jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropboxstudent').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
  update: (coords) =>
    $('#student_crop_x').val(coords.x)
    $('#student_crop_y').val(coords.y)
    $('#student_crop_w').val(coords.w)
    $('#student_crop_h').val(coords.h)
    @updatePreview(coords)
  updatePreview: (coords) =>
    $('#previewstudent').css
      width: Math.round(100/coords.w * $('#cropboxstudent').width()) + 'px'
      height: Math.round(100/coords.h * $('#cropboxstudent').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'