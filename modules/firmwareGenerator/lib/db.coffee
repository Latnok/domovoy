import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])

if !db?
  @db = {}
db.firmwares = new Mongo.Collection('firmwares')

db.firmwares.permit(['insert', 'update', 'remove']).allowInClientCode()

if !schemes?
  @schemes = {}

schemes.firmwares = new SimpleSchema
  title:
    type: String
    label: "Title"
    max: 200
  code:
    type: String
    label: "code"
    max: 20000
    autoform:
      afFieldInput:
        type: "textarea"
        rows: 10

db.firmwares.attachSchema(schemes.firmwares, { tracker: Tracker })
