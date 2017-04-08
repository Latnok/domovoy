# window.Logger.info = (t)->
#   log.info(t)
#
# import kurento  from 'kurento-client'
# import kurentoUtils from 'kurento-utils'
#
# kurentoClient = undefined
# webRtcPeer = undefined
# pipeline = undefined

Template.ipcamWidgetContent.onRendered(() ->
  log.info "ipcamWidgetContent"
  #
  # stop = ()->
  #   if webRtcPeer
  #     webRtcPeer.dispose();
  #     webRtcPeer = null;
  #   if pipeline
  #     pipeline.release();
  #     pipeline = null;
  #
  # onError = (error) ->
  #   if error
  #     console.error error
  #     stop();
  #
  # setIceCandidateCallbacks = (webRtcEndpoint, webRtcPeer, onError)->
  #   webRtcPeer.on('icecandidate', (candidate) ->
  #     console.log("Local icecandidate " + JSON.stringify(candidate));
  #     candidate = kurentoClient.register.complexTypes.IceCandidate(candidate);
  #     webRtcEndpoint.addIceCandidate(candidate, onError);
  #   )
  #   webRtcEndpoint.on('OnIceCandidate', (event) ->
  #     candidate = event.candidate;
  #     console.log("Remote icecandidate " + JSON.stringify(candidate));
  #     webRtcPeer.addIceCandidate(candidate, onError);
  #   )
  #
  # webRtcPeer = kurentoUtils.WebRtcPeer.WebRtcPeerRecvonly(remoteVideo : $("#videoOutput"), (error) ->
  #   if error
  #     onError(error);
  #   webRtcPeer.generateOffer(onOffer);
  #   webRtcPeer.peerConnection.addEventListener('iceconnectionstatechange', (event) ->
  #     if webRtcPeer && webRtcPeer.peerConnection
  #       console.log("oniceconnectionstatechange -> " + webRtcPeer.peerConnection.iceConnectionState);
  #       console.log('icegatheringstate -> ' + webRtcPeer.peerConnection.iceGatheringState);
  #   )
  # )
  #
  # onOffer = (error, sdpOffer) ->
  #   if error
  #     onError(error);
  #
  #   syncedClient = Meteor.wrapAsync(kurento);
  #   kurentoClient = syncedClient('ws://10.10.1.177:8888/kurento');
  #
  #   syncedPipeline = Meteor.wrapAsync(kurentoClient.create, kurentoClient);
  #   pipeline = syncedPipeline('MediaPipeline');
  #
  #   syncedPlayerEndpoint = Meteor.wrapAsync(pipeline.create, pipeline);
  #   PlayerEndpoint = syncedPlayerEndpoint('PlayerEndpoint',{uri: "rtsp://10.10.1.14:554/ch0_0.h264"});
  #
  #   syncedwebRtc = Meteor.wrapAsync(pipeline.create, pipeline);
  #   webRtcEndpoint = syncedwebRtc('WebRtcEndpoint');
  #
  #   setIceCandidateCallbacks(webRtcEndpoint, webRtcPeer, onError)
  #
  #   webRtcEndpoint.processOffer(sdpOffer, (error, sdpAnswer) ->
  #     if error
  #       onError(error);
  #     webRtcEndpoint.gatherCandidates(onError);
  #     webRtcPeer.processAnswer(sdpAnswer);
  #   )
  #
  #   PlayerEndpoint.connect(webRtcEndpoint, (error) ->
  #     if error
  #       onError(error);
  #
  #     console.log("PlayerEndpoint-->WebRtcEndpoint connection established");
  #
  #     player.play((error) ->
  #       if error
  #         onError(error);
  #
  #       console.log("Player playing ...");
  #     )
  #   )
)
