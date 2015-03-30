package com.headbangers.mordheim

// accès anonyme
class PublicController {

    def band() {

        def band = Band.get(params.id)
        if (!band) {
            redirect action: 'index'
            return
        }

        render(view: '/band/show', model: [bandInstance: band, anonymous: true])

    }
}
