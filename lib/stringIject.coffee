Meteor.stringInject = (str, data)->
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
