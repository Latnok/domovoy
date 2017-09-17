Meteor.methods
  generate: (settings, template)->
    frimwareCode = db.firmwares.findOne(template)
    firmawareCode = firmawareCode.replace(/{{ssid}}/, "Latnok")
    log.info firmawareCode
