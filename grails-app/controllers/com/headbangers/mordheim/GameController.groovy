package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
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

    def savedeadwrench() {
        println params
        redirect(action:'deadheroes', id: params.band)
        return
    }

    def deadheroes (){
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {
            render view: 'deadheroes', model: [bandInstance: bandInstance]
        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    def savedeadheroes(){
        println params
        redirect(action:'bandgains', id: params.band)
        return
    }

    def bandgains (){
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            render view: 'bandgains', model: [bandInstance: bandInstance]

        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }
}
