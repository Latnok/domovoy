FlowRouter.route('/',
  action: ({params}) ->
    BlazeLayout.render("default", {main:"root"});
);

FlowRouter.route('/test',
  action: ({params}) ->
    BlazeLayout.render("default", {main:"test"});
);

AccountsTemplates.configure({
    defaultLayout: 'default',
    defaultTemplate: 'fullPageAtForm',
    defaultLayoutRegions: {},
    defaultContentRegion: 'main'
});

AccountsTemplates.configureRoute('signUp',
  template: 'signUp'
);
AccountsTemplates.configureRoute('signIn',
  template: 'signIn'
);

FlowRouter.triggers.enter([AccountsTemplates.ensureSignedIn]);
