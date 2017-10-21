FlowRouter.route('/devices/add',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"devicesItem"
    );
);
FlowRouter.route('/devices/item/:devicesItemId',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"devicesItem"
    );
);

Template.devicesItem.onCreated(()->
  if FlowRouter.getParam("devicesItemId")?
    @subscribe "devicesItem", FlowRouter.getParam("devicesItemId")
)

Template.devicesItem.onRendered(()->
)

Template.devicesItem.onDestroyed(()->
)

Template.devicesItem.helpers
  collection: ()->
    db.devices
  doc: ()->
    db.devices.findOne(FlowRouter.getParam("devicesItemId"))

Template.devicesItem.events
  "click ": (event, instance)->
