package com.headbangers.mordheim


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WrenchmenController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Wrenchmen.list(params), model: [wrenchmenInstanceCount: Wrenchmen.count()]
    }

    def show(Wrenchmen wrenchmenInstance) {
        respond wrenchmenInstance
    }

    def create() {
        Wrenchmen man = new Wrenchmen(params)
        [bandId: params.band, wrenchmenInstance: man]
    }

    @Transactional
    def save(Wrenchmen wrenchmenInstance) {
        if (wrenchmenInstance == null) {
            notFound()
            return
        }

        if (wrenchmenInstance.hasErrors()) {
            respond wrenchmenInstance.errors, view: 'create'
            return
        }

        def band = Band.get(params.band)
        if (band == null) {
            redirect action: 'index', controller: 'band'
            return
        }

        band.wrenches.add(wrenchmenInstance)
        band.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'wrenchmen.label', default: 'Wrenchmen'), wrenchmenInstance.id])
                redirect controller: 'band', action: 'show', id: band.id, params: [tab: 'wrench']
            }
            '*' { respond wrenchmenInstance, [status: CREATED] }
        }
    }

    def edit(Wrenchmen wrenchmenInstance) {
        respond wrenchmenInstance
    }

    @Transactional
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Wrenchmen.label', default: 'Wrenchmen'), wrenchmenInstance.id])
                redirect wrenchmenInstance
            }
            '*' { respond wrenchmenInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Wrenchmen wrenchmenInstance) {

        if (wrenchmenInstance == null) {
            notFound()
            return
        }

        wrenchmenInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Wrenchmen.label', default: 'Wrenchmen'), wrenchmenInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'wrenchmen.label', default: 'Wrenchmen'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
