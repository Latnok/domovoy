import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])

if !db?
  @db = {}
db.firmwares = new Mongo.Collection('firmwares')

db.firmwares.permit(['insert', 'update', 'remove']).allowInClientCode()

if !schemes?
  @schemes = {}

schemes.firmwares = new SimpleSchema
  type:
    type: String
    label: "Type"
    max: 200
  createdAt:
    type: Date
    label: "Created"
  title:
    type: String
    label: "Title"
    max: 200
  "src/main~ino":
    type: String
    label: "src/main.ino"
    max: 20000
    autoform:
      afFieldInput:
        type: "textarea"
        rows: 10

db.firmwares.attachSchema(schemes.firmwares, { tracker: Tracker })
