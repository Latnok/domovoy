import { EJSON } from 'meteor/ejson'
templates = db.firmwares.find(title:"esp8266Template")

if templates.count() == 0

  fwTemplate = Assets.getText("esp8266Template/src/main.ino")
  iniTemplate = Assets.getText("esp8266Template/platformio.ini")

  varsScheme =
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
    sensors:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10
    readDelay:
      type:Number
      optional: true
      defaultValue: 3000
    configSensors:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10
    executors:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10
    configExecutors:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10
    vars:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 50
    funcs:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 100
    setupInject:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10
    mqttCallbackInject:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10
    mqttConnectInject:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10
    loopInject:
      type: String
      optional: true
      afFieldInput:
        type: "textarea"
        rows: 10

  db.firmwares.insert(
    title:"esp8266Template"
    parent:"root"
    version:"0.1"
    readOnly:true
    owner:"domovoy"
    type:"template"
    varsScheme: EJSON.stringify(varsScheme)
    "src/main~ino":fwTemplate
    "platformio~ini":iniTemplate
    createdAt: new Date()
    updatedAt: new Date()
  )
