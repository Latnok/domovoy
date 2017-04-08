mosca = require 'mosca'

settings =
  port: 1883,
  backend:
    type: 'mongo',
    url: process.env.MONGO_URL,
    pubsubCollection: 'mqttMessages',
    mongo: {}

@mqttServer = new mosca.Server settings

mqttServer.on 'error', (error) ->
  log.warn("(Mosca) error #{error}");

mqttServer.on 'clientConnected', Meteor.bindEnvironment((client) ->
  db.devices.update clientId: client.id,
    $set:
      connected: new Date()
  ,
    upsert:true
  log.info("(Mosca) client connected #{client.id}");
)

mqttServer.on 'published',  Meteor.bindEnvironment((packet, client) ->
  parts = packet.topic.split('/');
  if typeof packet.payload != 'string'
    value = parseInt(String.fromCharCode.apply(String, packet.payload))
  else
    value = packet.payload
  db.devices.update clientId: parts[2],
    $set:
      "sensors.#{parts[4]}":
        value:value
        title:parts[4]
)

mqttServer.on 'ready', () ->
  log.info('(Mosca) server is up and running')
