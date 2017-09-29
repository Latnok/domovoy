FlowRouter.route('/firmwareList',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"firmwareList"
    )
);

Template.firmwareList.onCreated(()->
  @subscribe("firmwaresList")
)

Template.firmwareList.onRendered(()->

)

Template.firmwareList.helpers
  templates: ()->
    db.firmwares.find(type:"template")
  results: ()->
    db.firmwares.find(type:"result")

  settings: ()->
    {
      rowsPerPage: 50
      showFilter: false
      showRowCount:true
      showNavigation:"auto"
      fields: [
        {key:"title", label:"Title"},
        {key:"updatedAt", label:"Updated"},
        {key:"version", label:"Version"},
        {key:"parent", label:"Parent"},
        {key:"owner", label:"Owner"},
      ]
    }

Template.firmwareList.events
  'click .reactive-table tbody tr': (event) ->
    FlowRouter.go("/firmwareEditor/"+@_id);
