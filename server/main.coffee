import { Meteor } from 'meteor/meteor';

db.mmqtt.mqttConnect("mqtt://localhost", ["mmqtt"], {}, {});

Meteor.startup =>
  db.mmqtt.insert
    topic: "mmqtt"
    message: "startup"
    broadcast: true
