# DocPad Configuration File
# http://docpad.org/docs/config

pathChecked = false

# Define the DocPad Configuration
docpadConfig = {
	plugins:
        ghpages:
            deployRemote: 'target'
            deployBranch: 'master'


    collections:
        videoPages: ->
            @getCollection('html').findAllLive({relativeOutDirPath: {$beginsWith: 'videos'}}).on "add", (model) ->
                model.setMetaDefaults({layout:"video"})

    templateData:
        # Specify some site properties
        site:
            # The production URL of our website
            url: "https://forums.handmadehero.org/jace"

            # The default title of our website
            title: "Handmade Companion"

            # The website description (for SEO)
            description: """
                When your website appears in search results in say Google, the text here will be shown underneath your website's title.
                """

            # The website keywords (for SEO) separated by commas
            keywords: """
                place, your, website, keywoards, here, keep, them, related, to, the, content, of, your, website
                """

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