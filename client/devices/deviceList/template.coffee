FlowRouter.route('/deviceList',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"deviceList"
    );
);

Template.deviceList.onCreated(()->
  @subscribe("deviceList")
)

Template.deviceList.onRendered(()->
)

Template.deviceList.onDestroyed(()->
)

Template.deviceList.helpers
  "": ()->


Template.deviceList.events
  "click ": (event, instance)->
