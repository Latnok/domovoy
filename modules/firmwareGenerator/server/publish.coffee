Meteor.publish("firmwaresList", ()->
  db.firmwares.find()
)

Meteor.publish("firmwareItem", (_id)->
  db.firmwares.find(_id)
)
