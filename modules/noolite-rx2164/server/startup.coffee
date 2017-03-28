import { Meteor } from 'meteor/meteor'

Noolite = require 'noolite'

driver = new Noolite(
  "device": "rx2164"
)

Meteor.startup ->
  driver.open((err)->
    if (err)
      log.warn "[noolite-rx2164] driver error",
        message: err.message
    else
      log.info "[noolite-rx2164] device opened",
  )
