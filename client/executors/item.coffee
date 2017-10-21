FlowRouter.route('/executors/add',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"executorsItem"
    );
);
FlowRouter.route('/executors/item/:executorsItemId',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"executorsItem"
    );
);

Template.executorsItem.onCreated(()->
  if FlowRouter.getParam("executorsItemId")?
    @subscribe "executorsItem", FlowRouter.getParam("executorsItemId")
)

Template.executorsItem.onRendered(()->
)

Template.executorsItem.onDestroyed(()->
)

Template.executorsItem.helpers
  collection: ()->
    db.executors
  doc: ()->
    db.executors.findOne(FlowRouter.getParam("executorsItemId"))

Template.executorsItem.events
  "click ": (event, instance)->
