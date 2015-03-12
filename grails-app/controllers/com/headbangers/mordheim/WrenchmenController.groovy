package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WrenchmenController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_USER'])
    def create() {
        Wrenchmen man = new Wrenchmen(params)
        [bandId: params.band, wrenchmenInstance: man]
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def save(Wrenchmen wrenchmenInstance) {
        if (wrenchmenInstance == null) {
            notFound()
            return
        }

        if (wrenchmenInstance.hasErrors()) {
            respond wrenchmenInstance.errors, view: 'create'
            return
        }

        def band = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (band == null) {
            redirect action: 'index', controller: 'band'
            return
        }

        band.wrenches.add(wrenchmenInstance)
        band.gold = band.gold - wrenchmenInstance.cost
        band.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Wrenchmen.label', default: 'Wrenchmen'), wrenchmenInstance.name])
                redirect controller: 'band', action: 'show', id: band.id, params: [tab: 'wrench']
            }
            '*' { respond wrenchmenInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USER'])
    def edit(Wrenchmen wrenchmenInstance) {
        respond wrenchmenInstance
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def update(Wrenchmen wrenchmenInstance) {
        if (wrenchmenInstance == null) {
            notFound()
            return
        }

        if (wrenchmenInstance.hasErrors()) {
            respond wrenchmenInstance.errors, view: 'edit'
            return
        }

        wrenchmenInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Wrenchmen.label', default: 'Wrenchmen'), wrenchmenInstance.name])
                redirect action: "show", controller: 'band', id: wrenchmenInstance.band.id, method: "GET", params: [tab: 'wrench']
            }
            '*' { respond wrenchmenInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def delete(Wrenchmen wrenchmenInstance) {

        if (wrenchmenInstance == null) {
            notFound()
            return
        }

        def band = wrenchmenInstance.band
        wrenchmenInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Wrenchmen.label', default: 'Wrenchmen'), wrenchmenInstance.name])
                redirect action: "show", controller: 'band', id: band.id, method: "GET", params: [tab: 'wrench']
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Wrenchmen.label', default: 'Wrenchmen'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
