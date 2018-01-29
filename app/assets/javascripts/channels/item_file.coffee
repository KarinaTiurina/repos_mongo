jQuery(document).on 'turbolinks:load', ->
  repo = $('#repository')

  if repo.length > 0
    createItemFileChannel repo.data('repository-id')

  $( "#item_file_form" ).submit (event)->
    console.log('submit item_file')
    name = $("#item_file_name").val()

    reader = new FileReader()
    file_name = $("#item_file_source_file").get(0).files[0].name
    reader.onload = ->
      App.item_file.load(name, reader.result)
      window.location.replace("/repositories/" + repo.data('repository-id'));

    reader.readAsDataURL $("#item_file_source_file").get(0).files[0]

    event.preventDefault()

recievedUrl = (source_file) ->
  source_file = fr.result

createItemFileChannel = (repoId) ->
  App.item_file = App.cable.subscriptions.create { channel: "ItemFileChannel", repoId: repoId },
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log('Connected to ItemFileChannel')

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log('Disconnected from ItemFileChannel')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Recieved message: ' + data['item_file'])
      $('#item_files').append data['item_file']

    load: (name, source_file) ->
      console.log("item_file load")
      @perform 'load', name: name, source_file: source_file
