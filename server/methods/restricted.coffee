Meteor.methods
  mqttPub: ({message, topic, clientId}) ->
    packet =
      topic: topic,
      payload: message,
      qos: 0,
      retain: false
    mqttServer.publish packet

  mqttConnected: ({clientId}) ->
    packet =
      topic: "home/clients",
      payload: "(Domovoy) DDP client #{clientId} connected",
      qos: 0,
      retain: false
    mqttServer.publish packet
    packet =
      topic: "home/clients/#{clientId}",
      payload: "(Domovoy) DDP client startup",
      qos: 0,
      retain: false
    mqttServer.publish packet
