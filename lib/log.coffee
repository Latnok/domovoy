import { Logger } from 'meteor/ostrio:logger';
import { LoggerConsole } from 'meteor/ostrio:loggerconsole';

@systemLogger = new Logger()

SysLogConsole = new LoggerConsole(systemLogger)

SysLogConsole.enable()

verbose = true

if Meteor.isServer
  server = db.settings.findOne 'server'

logSource = -> (
  source = {}
  if Meteor.isServer
  	source =
      type: 'server',
      uuid: server?.uuid
  if Meteor.isClient
  	source =
      type: 'client',
      fingerprint: @fingerprint
  source
)

addSourceToData = (data)->
  if verbose
    {}
  else
    data:data
    source:logSource()

@log =
  error: (message, data)->
    systemLogger.error message, addSourceToData(data)
  debug: (message, data)->
    systemLogger.debug message, addSourceToData(data)
  warn: (message, data)->
    systemLogger.warn message, addSourceToData(data)
  trace: (message, data)->
    systemLogger.trace message, addSourceToData(data)
  info: (message, data)->
    systemLogger.info message, addSourceToData(data)

log.info "(Domovoy) version: #{Revision.branch()} #{Revision.short()}"
