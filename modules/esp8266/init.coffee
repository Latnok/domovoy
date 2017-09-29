import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])

title = "esp8266Template"

if !schemes?
  @schemes = {}

schemes["#{title}_varsScheme"] = new SimpleSchema
  ssid:
    type: String
    optional: true
  password:
    type: String
    optional: true
  mqttServerIP:
    type: String
    optional: true
  mqttServerPort:
    type: Number
    optional: true
  readDelay:
    type: Number
    optional: true
    defaultValue: 3000
  configSensors:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"
  configExecutors:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"
  vars:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"
  funcs:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"
  setupInject:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"
  mqttCallbackInject:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"
  mqttConnectInject:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"
  loopInject:
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: "textarea"
        class: "code-area"

if Meteor.isServer
  templates = db.firmwares.find(title:title, parent:"root")
  if templates.count() == 0
    fwTemplate = Assets.getText("#{title}/src/main.ino")
    iniTemplate = Assets.getText("#{title}/platformio.ini")
    db.firmwares.insert(
      title: title
      parent: "root"
      version: "0.1"
      readOnly: true
      owner: "domovoy"
      type: "template"
      varsScheme: "#{title}_varsScheme"
      "src/main~ino": fwTemplate
      "platformio~ini": iniTemplate
      createdAt: new Date()
      updatedAt: new Date()
    )
