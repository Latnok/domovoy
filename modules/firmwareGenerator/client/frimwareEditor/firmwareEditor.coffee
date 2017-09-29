FlowRouter.route('/firmwareEditor/:firmwareItem',
  action: ({params}) ->
    BlazeLayout.render("default",
      content:"firmwareEditor"
    )
);

#require("codemirror/mode/javascript/javascript")
require("codemirror/mode/clike/clike")
require("codemirror/addon/edit/closebrackets")
codeMirror = require("codemirror")

saveSrc = (codeMirrorEditor) ->
  _id = FlowRouter.getParam("firmwareItem")
  src = codeMirrorEditor.getValue()
  db.firmwares.update _id,
    $set:
      "src/main~ino": src
      updatedAt: new Date()
    $inc:
      version:0.001

Template.firmwareEditor.onCreated(()->
  a = @subscribe "firmwareItem", FlowRouter.getParam("firmwareItem")
  @autorun(()->
    if a.ready()
      if !@_templateInstance.codeMirrorEditor.loaded
        @_templateInstance.codeMirrorEditor.setValue(db.firmwares.findOne()["src/main~ino"])
        @_templateInstance.codeMirrorEditor.loaded = true
  )
)

Template.firmwareEditor.onRendered(()->
  @codeMirrorEditor = codeMirror.fromTextArea($('#codeArea')[0],
    lineNumbers: true
    theme: "dracula"
    mode: "clike"
  )
  @codeMirrorEditor.loaded = false
  @codeMirrorEditor.on("change", (cmInstance, changeObj)->
    if cmInstance.loaded
      if cmInstance.timeout
        Meteor.clearTimeout(cmInstance.timeout)
      cmInstance.timeout = Meteor.setTimeout(()->
        saveSrc(cmInstance)
      , 3000)
  )
)

Template.firmwareEditor.onDestroyed(()->
  saveSrc(@codeMirrorEditor)
  $("div.CodeMirror").remove()
)

Template.firmwareEditor.helpers

Template.firmwareEditor.events
  "click #save": (event, instance)->
    saveSrc(instance.codeMirrorEditor)
