import { Meteor } from 'meteor/meteor'
Noolite = require 'noolite'
Scanner = require 'bluetooth-scanner'

myName = "domovoy"

driver = new Noolite
  device: 'rx2164'

driver.open((err)->
  console.log err
)

device = "hci0"
bleScanner = new Scanner(device, (mac, name) ->
    console.log 'Found device: ' + name
)

bleScanner.on "error", (err) ->
  console.log 'bleScanner: ' + err

db.mmqtt.mqttConnect("mqtt://localhost", [myName], {}, {})

Meteor.startup =>
  db.mmqtt.insert
    topic: "home/" + myName + "/"
    message: "startup"
    broadcast: true
