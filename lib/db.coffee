import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])

if !db?
  @db = {}

db.settings = new Mongo.Collection('settings')
db.mqttMessages = new Mongo.Collection("mqttMessages")

db.devices = new Mongo.Collection('devices')
