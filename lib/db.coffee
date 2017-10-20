import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])
SimpleSchema.debug = true

if !db?
  @db = {}

if !schemes?
  @schemes = {}

db.settings = new Mongo.Collection('settings')
db.mqttMessages = new Mongo.Collection("mqttMessages")

db.devices = new Mongo.Collection('devices')
db.sensors = new Mongo.Collection('sensors')
db.executors = new Mongo.Collection('executors')

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
,
  tracker: Tracker

schemes.device = new SimpleSchema
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
,
  tracker: Tracker

db.devices.permit(['insert', 'update']).allowInClientCode()
db.sensors.permit(['insert', 'update']).allowInClientCode()
db.executors.permit(['insert', 'update']).allowInClientCode()

db.devices.attachSchema(schemes.device)
db.sensors.attachSchema(schemes.plugable)
db.executors.attachSchema(schemes.plugable)
