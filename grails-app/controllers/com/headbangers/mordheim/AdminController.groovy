package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN'])
class AdminController {

    static allowedMethods = [deleteband: "DELETE"]

    def index(Integer max) {
        redirect(controller: 'person', action: 'index')
    }

    def showband() {
        def band = Band.get(params.id)
        if (!band) {
            redirect(action: 'index', controller: 'person')
            return
        }

        render(view: 'showband', model: [bandInstance: band])
    }

    @Transactional
    def deleteband(){
        Band band = Band.get(params.band)
        if (!band){
            redirect(controller: '"person', action: "index")
            return
        }

        def ownerId = band.owner.id
        band.delete(flush: true)
        redirect(controller: "person", action: 'edit', id:ownerId)
    }
}
