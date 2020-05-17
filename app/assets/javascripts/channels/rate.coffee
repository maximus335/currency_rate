$(document).ready ->
  App.actual_rate = App.cable.subscriptions.create "RateChannel",

    connected: ->

    disconnected: ->

    received: (data) ->
        $('#current-rate').text(data["rate"] + "₽")