import Mosca from 'mosca'

settings =
  port: 1883
  backend:
    type: 'mongo',
    url: process.env.MONGO_URL,
    pubsubCollection: 'mqttMessages',
    mongo: {}

moscaSettings = db.settings.findOne "mosca"

if moscaSettings?
  settings = _.extend settings, moscaSettings

@mqttServer = new Mosca.Server settings

mqttServer.on 'error', (error) ->
  log.warn("(Mosca) error #{error}");

mqttServer.on 'clientConnected', Meteor.bindEnvironment((client) ->
  log.info("(Mosca) client connected #{client.id}");
)

mqttServer.on 'published',  Meteor.bindEnvironment((packet, client) ->
  parts = packet.topic.split('/');
  if typeof packet.payload != 'string'
    value = parseInt(String.fromCharCode.apply(String, packet.payload))
  else
    value = packet.payload
)

mqttServer.on 'ready', () ->
  log.info("(Mosca) server is up and running on port #{settings.port}")
