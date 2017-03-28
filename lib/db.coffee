@db = {}

db.appLogs = new Mongo.Collection('appLogs');
db.settings = new Mongo.Collection('settings');
db.mqttMessages = new Mongo.Collection("mqttMessages");
