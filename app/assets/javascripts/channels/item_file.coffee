jQuery(document).on 'turbolinks:load', ->
  repo = $('#repository')

  if repo.length > 0
    createItemFileChannel repo.data('repository-id')

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
      console.log('Recieved message: ' + data['message'])

    load: (message) ->
      @perform 'load', message: message
