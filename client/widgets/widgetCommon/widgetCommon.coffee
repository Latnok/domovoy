Template.widgetCommon.helpers(
  contentTemplate: ()->
    @type + 'WidgetContent'
  settingContentTemplate: ()->
    @type + 'WidgetSettingsContent'
)

Template.widgetCommon.events(
  'click .toggle-widget-setup': (event)->
    $(event.currentTarget).parents(".proton-widget").toggleClass("setup")
)
