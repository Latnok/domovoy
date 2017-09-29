if !db?
  @db = {}

db.settings = new Mongo.Collection('settings')
db.mqttMessages = new Mongo.Collection("mqttMessages")

db.devices = new Mongo.Collection('devices')
db.sensors = new Mongo.Collection('sensors')
db.executors = new Mongo.Collection('executors')
