$ ->
  addPhoto = (file) ->
    console.log(file)
    $('#photos').append HandlebarsTemplates['photos/show'](file)

  renderPhotos = (photos) ->
    addPhoto photo for photo in photos

  $('#fileupload').fileupload
    dataType: 'json'
    url: $('#fileupload').data('photos-path')
    done: (e, data) ->
      addPhoto file for file in data.result

  if $('#photos').length
    $.getJSON $('#photos').data('json-url'), (results) ->
      renderPhotos results.gallery.photos
