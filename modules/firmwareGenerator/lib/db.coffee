import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['autoform'])

if !db?
  @db = {}
db.firmwares = new Mongo.Collection('firmwares')

db.firmwares.permit(['insert', 'update']).allowInClientCode()

if !schemes?
  @schemes = {}

schemes.firmwares = new SimpleSchema
  type:
    type: String
    label: "Type"
  createdAt:
    type: Date
    label: "Created"
  updatedAt:
    type: Date
    label: "Updated"
  owner:
    type: String
    label: "Owner"
  parent:
    type: String
    label: "Parent"
  title:
    type: String
    label: "Title"
  version:
    type: Number
    label: "Version"
  readOnly:
    type: Boolean
    label: "Read only"
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

db.firmwares.attachSchema(schemes.firmwares, { tracker: Tracker })
