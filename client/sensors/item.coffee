FlowRouter.route('/sensors/add',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"sensorsItem"
    );
);
FlowRouter.route('/sensors/item/:sensorsItemId',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"sensorsItem"
    );
);

Template.sensorsItem.onCreated(()->
  if FlowRouter.getParam("sensorsItemId")?
    @subscribe "sensorsItem", FlowRouter.getParam("sensorsItemId")
)

Template.sensorsItem.onRendered(()->
)

Template.sensorsItem.onDestroyed(()->
)

Template.sensorsItem.helpers
  collection: ()->
    db.sensors
  doc: ()->
    db.sensors.findOne(FlowRouter.getParam("sensorsItemId"))

Template.sensorsItem.events
  "click ": (event, instance)->
