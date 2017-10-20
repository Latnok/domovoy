import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])

if !db?
  @db = {}

if !schemes?
  @schemes = {}

schemes.firmwares = new SimpleSchema
  type:
    type: String
  createdAt:
    type: Date
  updatedAt:
    type: Date
  owner:
    type: String
  parent:
    type: String
  title:
    type: String
  version:
    type: Number
  readOnly:
    type: Boolean
  "src/main~ino":
    type: String
    label: "src/main.ino"
    autoform:
      afFieldInput:
        type: "textarea"
  "platformio~ini":
    type: String
    label: "platformio.ini"
    autoform:
      afFieldInput:
        type: "textarea"
  varsScheme:
    type: String
,
  tracker: Tracker

db.firmwares = new Mongo.Collection('firmwares')

db.firmwares.permit(['insert', 'update']).allowInClientCode()
db.firmwares.attachSchema(schemes.firmwares)
