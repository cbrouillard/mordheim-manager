package com.headbangers.mordheim

class GameController {

    def springSecurityService

    def endgame() {
        redirect action: "deadwrench", id: params.id
    }

    def deadwrench() {
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            render view: 'deadwrench', model: [bandInstance: bandInstance]

        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }
}
