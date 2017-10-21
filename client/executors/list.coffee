FlowRouter.route('/executors/',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"executorsList"
    );
);

FlowRouter.route('/executors',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"executorsList"
    );
);

Template.executorsList.onCreated(()->
  @subscribe "executorsList"
)

Template.executorsList.onRendered(()->
)

Template.executorsList.onDestroyed(()->
)

Template.executorsList.helpers
  list: ()->
    db.executors.find()
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

Template.executorsList.events
  "click .item": (event, instance)->
    FlowRouter.go("/executors/item/"+@_id);
