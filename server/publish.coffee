Meteor.publish('devices', ()->
  db.devices.find()
)
