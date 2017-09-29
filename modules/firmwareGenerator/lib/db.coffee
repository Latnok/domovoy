import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])
SimpleSchema.debug = true

if !db?
  @db = {}

db.sensors = new Mongo.Collection('sensors')
db.executors = new Mongo.Collection('executors')
db.firmwares = new Mongo.Collection('firmwares')

db.sensors.permit(['insert', 'update']).allowInClientCode()
db.executors.permit(['insert', 'update']).allowInClientCode()
db.firmwares.permit(['insert', 'update']).allowInClientCode()

if !schemes?
  @schemes = {}

schemes.plugable = new SimpleSchema
  parent:
    type: String
  createdAt:
    type: Date
  updatedAt:
    type: Date
  owner:
    type: String
  title:
    type: String
  interface:
    type: Object
  "interface.mode":
    type: String
  "interface.varsScheme":
    optional: true
    type: String
  lib_deps:
    optional: true
    type: Array
    minCount:0
  "lib_deps.$":
    type: String
  firmwareTemplate:
    type: Object
    blackbox: true

schemes.firmwares = new SimpleSchema
  type:
    type: String
  createdAt:
    type: Date
  updatedAt:
    type: Date
  owner:
    type: String
  parent:
    type: String
  title:
    type: String
  version:
    type: Number
  readOnly:
    type: Boolean
  "src/main~ino":
    type: String
    label: "src/main.ino"
    autoform:
      afFieldInput:
        type: "textarea"
  "platformio~ini":
    type: String
    label: "platformio.ini"
    autoform:
      afFieldInput:
        type: "textarea"
  varsScheme:
    type: String

db.sensors.attachSchema(schemes.plugable, { tracker: Tracker })
db.executors.attachSchema(schemes.plugable, { tracker: Tracker })
db.firmwares.attachSchema(schemes.firmwares, { tracker: Tracker })
