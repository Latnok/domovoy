AccountsTemplates.configure({
  defaultLayout: 'minimal',
  defaultLayoutRegions: {},
  defaultContentRegion: 'content'
});

AccountsTemplates.configureRoute('signUp',
  template: 'signUp'
  path: '/signup'
);

AccountsTemplates.configureRoute('signIn',
  template: 'signIn'
  path: '/signin'
  redirect: '/dash'
);

FlowRouter.route('/exit',
  action: ({params}) ->
    Meteor.logout(()->
      FlowRouter.go("/")
    )
);

FlowRouter.triggers.enter([AccountsTemplates.ensureSignedIn]);
