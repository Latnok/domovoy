Template.signIn.onRendered(()->
  $('.sidebar, .wrapper').css('opacity', '1');
)

Template.signIn.events
  "click #signinBtn": (event, instance) ->
    Meteor.loginWithPassword($("#user")[0].value, $("#password")[0].value, (error, result)->
      if error
        log.warn error
      else
        FlowRouter.go("/dash")
    )
