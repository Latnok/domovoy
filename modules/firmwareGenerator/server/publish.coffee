Meteor.publish("firmwares-list", ()->
  db.firmwares.find()
)
