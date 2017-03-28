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

mqttServer.on 'clientConnected', (client) ->
  log.info("(Mosca) client connected #{client.id}");

mqttServer.on 'published', (packet, client) ->
  #log.info('(Mosca) recived message')

mqttServer.on 'ready', () ->
  log.info('(Mosca) server is up and running')
