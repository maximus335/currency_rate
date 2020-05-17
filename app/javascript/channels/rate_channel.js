import consumer from "./consumer"

consumer.subscriptions.create({ channel: "RateChannel" }, {
    received(data) {
        console.log('Test cable')
        $('#current-rate').text(data["rate"] + "₽")
    }
})
