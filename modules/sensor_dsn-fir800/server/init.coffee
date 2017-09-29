title = "dsn-fir800"

sensors = db.sensors.find(title:title)

setupInject = """
  pinMode({{devicePIN}}, INPUT);
"""

loopInject = """
    snprintf(topic, 75, "home/devices/%ls/sensors/{{title}}", clientName);
    snprintf(msg, 75, "%ld", digitalRead({{devicePIN}}));
    #ifdef DEBUG_SERIAL
      Serial.println(topic);
      Serial.println(msg);
    #endif
    mqttClient.publish(topic, msg);
"""

import SimpleSchema from 'simpl-schema'

if !schemes?
  @schemes = {}

@schemes["#{title}_varsScheme"] = new SimpleSchema
  devicePIN1:
    type: String
    defaultValue:"D1"

if sensors.count() == 0
  db.sensors.insert(
    parent: "root"
    createdAt: new Date()
    updatedAt: new Date()
    owner: "domovoy"
    title: title
    interface:
      mode: "1PIN"
      varsScheme: "#{title}_varsScheme"
    lib_deps: []
    firmwareTemplate:
      setupInject: setupInject
      loopInject: loopInject
  )
