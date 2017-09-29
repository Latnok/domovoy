import SimpleSchema from 'simpl-schema'

title = "4-relay"

setupInject = """
  pinMode({{devicePIN1}}, OUTPUT);
  pinMode({{devicePIN2}}, OUTPUT);
  pinMode({{devicePIN3}}, OUTPUT);
  pinMode({{devicePIN4}}, OUTPUT);
"""

mqttCallbackInject = """
    int relay = payload[0];
    if (String(splitter->getItemAtIndex(4)) == "setRelayOn") {
      digitalWrite(relay, HIGH);
    }
    if (String(splitter->getItemAtIndex(4)) == "setRelayOff") {
      digitalWrite(relay, LOW);
    }
    if (String(splitter->getItemAtIndex(4)) == "toggleRelay") {
      digitalWrite(relay, !digitalRead(relay));
    }
    if (String(splitter->getItemAtIndex(4)) == "{{title}}") {
      snprintf(topic, 75, "home/devices/%ls/executors/{{title}}/%ld", clientName, relay);
      snprintf(msg, 5, "%ld", digitalRead(relay));
      mqttClient.publish(topic, msg);
    }
"""

if !schemes?
  @schemes = {}

schemes["#{title}_varsScheme"] = new SimpleSchema
  devicePIN1:
    type: String
    defaultValue: "D6"
  devicePIN2:
    type: String
    defaultValue: "D7"
  devicePIN3:
    type: String
    defaultValue: "D8"
  devicePIN4:
    type: String
    defaultValue: "D9"

if Meteor.isServer
  executors = db.executors.find(title:title)
  if executors.count() == 0
    db.executors.insert(
      parent: "root"
      createdAt: new Date()
      updatedAt: new Date()
      owner: "domovoy"
      title: title
      interface:
        mode: "4PIN"
        varsScheme: "#{title}_varsScheme"
      lib_deps: []
      firmwareTemplate:
        setupInject: setupInject
        mqttCallbackInject: mqttCallbackInject
    )
