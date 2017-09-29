serverSets = db.settings.findOne 'server'
initiated = _.isString serverSets?.uuid

if !initiated
  log.info "(Domovoy) server init startup"
  chp = require 'child_process'

  ls = chp.spawn('uuidgen', ['-r'])
  ls.stdout.on('data', Meteor.bindEnvironment((data) ->
    uuidString = data.toString().replace("\n", '')
    db.settings.insert
      _id:'server',
      uuid:uuidString
    if log?
      log.info "(Domovoy) server uuid: #{uuidString}"
  ))

  Accounts.createUser username:'root', password:'root', email:'root@domovoy.local'

else
  log.info "(Domovoy) server already initiated"
