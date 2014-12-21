# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
    collections:
        videoPages: ->
            @getCollection("html").findAllLive({relativeOutDirPath: {$beginsWith: "videos"}}).on "add", (model) ->
                model.setMetaDefaults({layout:"video"})

    templateData:
        site:
            title: "Handmade Companion"

        rootPath: ->
            if process.env["HOSTROOT"]?
                "/#{process.env["HOSTROOT"]}"
            else
                ""

        addScript: (src)->
            @document.scripts = [] unless @document.scripts? 
            @document.scripts.push(src) unless src in @document.scripts
}

# Export the DocPad Configuration
module.exports = docpadConfig
