import { Meteor } from 'meteor/meteor';

db.mmqtt.mqttConnect("mqtt://localhost", ["mmqtt"], {}, {});
console.log("server")

Meteor.startup =>
  console.log("startup")
  db.mmqtt.insert
    topic: "mmqtt"
    message: "startup"
    broadcast: true
