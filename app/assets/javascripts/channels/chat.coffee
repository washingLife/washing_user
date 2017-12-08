App.chat = App.cable.subscriptions.create {channel: "UserChannel", user_id: window.user_id},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append("<p class='text-right bg-info'>" + data.message + '</p>')

  speak: (msg) ->
    @perform 'speak', message: msg
