import SimpleSchema from 'simpl-schema'

title = "bh1750"

vars = """
#include <Wire.h>
#include <BH1750.h>
BH1750 lightMeter({{I2CAddr}});
"""

setupInject = """
  Wire.begin({{devicePIN1}}, {{devicePIN2}});
  lightMeter.begin();
"""

loopInject = """
    snprintf(topic, 75, "home/devices/%ls/sensors/{{title}}", clientName);
    snprintf(msg, 75, "%ld", lightMeter.readLightLevel());
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
    defaultValue: "D5"
  devicePIN2:
    type: String
    defaultValue: "D4"
  I2CAddr:
    type: String
    defaultValue: "0x23"


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
        mode: "I2C"
        varsScheme: "#{title}_varsScheme"
      lib_deps: ["BH1750"]
      firmwareTemplate:
        vars: vars
        setupInject: setupInject
        loopInject: loopInject
    )
