$ ->
  addPhoto = (file) ->
    $('<li><img src="'+file.thumbnail_url+'"></li>').appendTo('#photos')

  $('#fileupload').fileupload
    dataType: 'json'
    url: $('#fileupload').data('photos-path')
    done: (e, data) ->
      addPhoto file for file in data.result
