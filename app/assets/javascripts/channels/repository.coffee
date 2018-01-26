App.repository = App.cable.subscriptions.create "RepositoryChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected to RepositoryChannel')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected from RepositoryChannel')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('Recieved message: ' + data['repository'])
    $('#repositories').append data['repository']

  load: (name) ->
    @perform 'load', name: name
