stringInject = (str, data)->
  _.forEach(data, (key)->
    str = str.replace(/({{([^}]+)}})/g, (i)->
      key = i.replace(/{{/, '').replace(/}}/, '')
      if (!_.isUndefined(data[key]))
        data[key]
      else
        i
    )
  )
  str.replace(/({{([^}]+)}})/g, (i)-> "[[undefined key #{i}]]")

vars =
  ssid:"wifi"
  password:"pass"
  mqttServerIP: "10.10.1.177"
  mqttServerPort: 1884
  sensors: ""
  readDelay: 3000
  configSensors:""
  executors: ""
  configExecutors:""
  vars:""
  funcs:""
  setupInject:""
  mqttCallbackInject:""
  mqttConnectInject:""
  loopInject:""

Template.firmwareList.onCreated(()->
  @subscribe("firmwares-list")
)

Template.firmwareList.onRendered(()->

)

Template.firmwareList.helpers
  sitest: ()->
    template = db.firmwares.findOne(type:"template")
    if template
      Meteor.defer(()->
        hljs.highlightBlock($("#codeTemplate")[0]);
      )
      stringInject(template["src/main~ino"], vars)

  templates: ()->
    db.firmwares.find(type:"template")
  results: ()->
    db.firmwares.find(type:"result")

  settings: ()->
    {
      rowsPerPage: 10,
      showFilter: false,
      fields: ['title']
    }
