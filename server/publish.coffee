Meteor.publish('deviceList', ()->
  db.devices.find()
)

Meteor.publish("deviceItem", (_id)->
  db.devices.find _id
)

Meteor.publish("executors", ()->
  db.executors.find()
)

Meteor.publish("sensors", ()->
  db.executors.find()
)
