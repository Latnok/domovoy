FlowRouter.route('/',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"root"
    )
);

Template.root.onRendered(()->
)
