jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropboxmember').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
  update: (coords) =>
    $('#member_crop_x').val(coords.x)
    $('#member_crop_y').val(coords.y)
    $('#member_crop_w').val(coords.w)
    $('#member_crop_h').val(coords.h)
    @updatePreview(coords)
  updatePreview: (coords) =>
    $('#previewmember').css
      width: Math.round(100/coords.w * $('#cropboxmember').width()) + 'px'
      height: Math.round(100/coords.h * $('#cropboxmember').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'