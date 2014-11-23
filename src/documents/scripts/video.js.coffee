player = null

@createPlayer = (elementId, width, height, videoId, autostart) ->
    player = new YT.Player elementId, 
        width: width
        height: height
        videoId: videoId
        events:
            'onReady': (event) ->
                event.target.playVideo() if autostart

jumpToTime = (humanTime) ->
    numSeconds = humanTimeToSeconds humanTime
    player.seekTo numSeconds, true

humanTimeToSeconds = (humanTime) ->
    result = 0
    for element in humanTime.split(":")
        result = (result * 60) + parseInt(element, 10)
    result

$ ->
    $("a.marker-time").on 'click', (event)->
        event.preventDefault()
        jumpToTime $(event.target).data().humanTimecode
