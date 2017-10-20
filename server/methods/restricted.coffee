Meteor.methods
  mqttPub: ({message, topic, clientId}) ->
    packet =
      topic: topic,
      payload: message,
      qos: 0,
      retain: false
    mqttServer.publish packet

  mqttConnected: ({clientId, message}) ->
    packet =
      topic: "home/ddpClients",
      payload: "DDP client #{clientId} connected",
      qos: 0,
      retain: false
    mqttServer.publish packet
    packet =
      topic: "home/ddpClients/#{clientId}",
      payload: message,
      qos: 0,
      retain: false
    mqttServer.publish packet
