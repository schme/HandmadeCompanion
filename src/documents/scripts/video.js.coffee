autostart = false
player = null
$player = null
ytDeferred = $.Deferred()

@onYouTubeIframeAPIReady = ->
    ytDeferred.resolve()

jumpToTime = (humanTime) ->
    numSeconds = humanTimeToSeconds humanTime
    player.seekTo numSeconds, true

humanTimeToSeconds = (humanTime) ->
    result = 0
    for element in humanTime.split(":")
        result = (result * 60) + parseInt(element, 10)
    result

$ ->
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

    setSize = (size) ->
        (event)->
            event.preventDefault()
            $player.attr('class', size)

    $("a[name=player-small]").on 'click', setSize("small")
    $("a[name=player-medium]").on 'click', setSize("medium")
    $("a[name=player-large]").on 'click', setSize("large")
