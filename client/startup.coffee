import 'codemirror/lib/codemirror.css';
import 'codemirror/theme/dracula.css';

import Fingerprint from 'fingerprintjs2'

log.info "userId: #{Meteor.userId()}"

fp = new Fingerprint()
fp.get((result, components) ->
  @fingerprint = result
  log.info "(Domovoy) client fingerprint: #{fingerprint}, agent: #{navigator.userAgent}"
  Meteor.call('mqttConnected',
    clientId:fingerprint
    message:navigator.userAgent
  )
)
