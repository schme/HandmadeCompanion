# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	plugins:
        ghpages:
            deployRemote: 'target'
            deployBranch: 'master'

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
}

# Export the DocPad Configuration
module.exports = docpadConfig