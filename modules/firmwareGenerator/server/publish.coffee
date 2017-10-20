Meteor.publish("firmwareList", ()->
  db.firmwares.find()
)

Meteor.publish("firmwareItem", (_id)->
  db.firmwares.find(_id)
)
