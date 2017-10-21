FlowRouter.route('/sensors/',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"sensorsList"
    );
);

FlowRouter.route('/sensors',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"sensorsList"
    );
);

Template.sensorsList.onCreated(()->
  @subscribe "sensorsList"
)

Template.sensorsList.onRendered(()->
)

Template.sensorsList.onDestroyed(()->
)

Template.sensorsList.helpers
  list: ()->
    db.sensors.find()
  settings: ()->
    {
      rowsPerPage: 50
      showFilter: false
      showRowCount:true
      showNavigation:"auto"
      rowClass:"item"
      fields: [
        {key:"title", label:"Title"},
        {key:"updatedAt", label:"Updated"}
      ]
    }

Template.sensorsList.events
  "click .item": (event, instance)->
    FlowRouter.go("/sensors/item/"+@_id);
