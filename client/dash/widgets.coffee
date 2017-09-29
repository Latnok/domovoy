FlowRouter.route('/dash',
  action: ({params}) ->
    BlazeLayout.render("dashboard",
      content:"widgets"
    );
);

Template.widgets.onCreated(()->
  @subscribe("devices")
)

Template.widgets.helpers(
  widgets: ()->
    db.devices.find()
)
