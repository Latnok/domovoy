Template.widgets.onCreated(()->
  @subscribe("devices")
)

Template.widgets.helpers(
  widgets: ()->
    db.devices.find()
)
