import SimpleSchema from 'simpl-schema'

title = "dsn-fir800"

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

if !schemes?
  @schemes = {}

schemes["#{title}_varsScheme"] = new SimpleSchema
  devicePIN1:
    type: String
    defaultValue:"D1"

if Meteor.isServer
  sensors = db.sensors.find(title:title)
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
