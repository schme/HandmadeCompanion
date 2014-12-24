autostart = false
ytDeferred = $.Deferred()

@onYouTubeIframeAPIReady = ->
    ytDeferred.resolve()

$ ->
    player = null
    $player = $('#player')
    
    ytDeferred.then ->
        player = new YT.Player 'player',
            videoId: $player.data().videoId
            events:
                'onReady': (event) ->
                    $player = $('#player')
                    event.target.playVideo() if autostart
    
    $("a.marker-time").on 'click', (event)->
        event.preventDefault()
        jumpToTime $(event.target).data().humanTimecode

    jumpToTime = (humanTime) ->
        numSeconds = humanTimeToSeconds humanTime
        player.seekTo numSeconds, true

    humanTimeToSeconds = (humanTime) ->
        result = 0
        for element in humanTime.split(":")
            result = (result * 60) + parseInt(element, 10)
        result
