Meteor.publish('devicesList', ()->
  db.devices.find()
)

Meteor.publish("devicesItem", (_id)->
  db.devices.find _id
)

Meteor.publish("executorsList", ()->
  db.executors.find()
)

Meteor.publish("executorsItem", (_id)->
  db.executors.find _id
)

Meteor.publish("sensorsList", ()->
  db.sensors.find()
)

Meteor.publish("sensorsItem", (_id)->
  db.sensors.find _id
)
