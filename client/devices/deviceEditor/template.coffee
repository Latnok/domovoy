AutoForm.debug();

FlowRouter.route('/deviceEditor',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"deviceEditor"
    );
);

FlowRouter.route('/deviceEditor/:deviceItem',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"deviceEditor"
    );
);

Template.deviceEditor.onCreated(()->
  if FlowRouter.getParam("deviceItem")?
    @subscribe "deviceItem", FlowRouter.getParam("deviceItem")
)

Template.deviceEditor.onRendered(()->
)

Template.deviceEditor.onDestroyed(()->
)

Template.deviceEditor.helpers
  "devices": ()->
    db.devices
  "doc": ()->
    db.devices.findOne(FlowRouter.getParam("deviceItem"))


Template.deviceEditor.events
  "click ": (event, instance)->
