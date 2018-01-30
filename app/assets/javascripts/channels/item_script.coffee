jQuery(document).on 'turbolinks:load', ->
  repo = $('#repository')

  if repo.length > 0
    createItemFileChannel repo.data('repository-id')

  $( "#item_script_form" ).submit (event)->
    console.log('submit item_script')
    name = $("#item_script_name").val()
    command = $("#item_script_command").val()

    reader = new FileReader()
    reader.onload = ->
      App.item_script.load(name, reader.result, command)
      window.location.replace("/repositories/" + repo.data('repository-id'));

    reader.readAsDataURL $("#item_script_source_file").get(0).files[0]

    event.preventDefault()

createItemFileChannel = (repoId) ->
  App.item_script = App.cable.subscriptions.create { channel: "ItemScriptChannel", repoId: repoId },
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log('Connected to ItemScriptChannel')

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log('Disconnected from ItemScriptChannel')

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log('Recieved message: ' + data['item_script'])
      $('#items').append data['item_script']

    load: (name, source_file, command) ->
      console.log("item_script load")
      @perform 'load', name: name, source_file: source_file, command: command
