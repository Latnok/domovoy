FlowRouter.route('/devices/',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"devicesList"
    );
);

FlowRouter.route('/devices',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"devicesList"
    );
);

Template.devicesList.onCreated(()->
  @subscribe "devicesList"
)

Template.devicesList.onRendered(()->
)

Template.devicesList.onDestroyed(()->
)

Template.devicesList.helpers
  list: ()->
    db.devices.find()
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

Template.devicesList.events
  "click .item": (event, instance)->
    FlowRouter.go("/devices/item/"+@_id);
