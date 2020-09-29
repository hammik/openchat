# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '.chat_submit',(event) -> 
      App.group.speak $('[data-behavior~=group_speaker]').val() ,$(':hidden[name="group_id"]').val() ,$(':hidden[name="user_id"]').val()
      $('[data-behavior~=group_speaker]').val('')
      event.preventDefault()


$(document).on 'keydown', '[data-behavior~=group_speaker]', (event) ->
      if event.keyCode is 13
            App.group.speak $('[data-behavior~=group_speaker]').val() ,$(':hidden[name="group_id"]').val() ,$(':hidden[name="user_id"]').val()
            $('[data-behavior~=group_speaker]').val('')
            event.preventDefault()