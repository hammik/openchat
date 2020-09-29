

  App.group = App.cable.subscriptions.create { channel: "GroupChannel", group_id: $('#messages').data('group_id') },{
  
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->

      $('#messages').append data['message']
    

    speak: (message,group_id,user_id) ->
      @perform 'speak', message: message, group_id: group_id, user_id: user_id
  }

    

 
  