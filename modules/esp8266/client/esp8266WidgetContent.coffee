Template.esp8266WidgetContent.helpers(
  "sensors": ()->
    _.toArray db.devices.findOne(clientId:Template.currentData().clientId)?.sensors
)
