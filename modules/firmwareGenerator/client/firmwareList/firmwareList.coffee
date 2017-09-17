Template.firmwareList.onCreated(()->
  Meteor.subscribe("firmwares-list")
)

Template.firmwareList.helpers
  list: ()->
    db.firmwares.find()

  settings: ()->
    {
      rowsPerPage: 10,
      showFilter: false,
      fields: ['title']
    }
