FlowRouter.route('/',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"root"
    )
);

FlowRouter.route('/test',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"test"
    )
);

FlowRouter.route('/dash',
  action: ({params}) ->
    BlazeLayout.render("dash");
);

AccountsTemplates.configure({
  defaultLayout: 'minimal',
  defaultTemplate: 'accForm',
  defaultLayoutRegions: {},
  defaultContentRegion: 'content'
});

AccountsTemplates.configureRoute('signUp',
  template: 'signUp'
);
AccountsTemplates.configureRoute('signIn',
  template: 'signIn'
);

#FlowRouter.triggers.enter([AccountsTemplates.ensureSignedIn]);
