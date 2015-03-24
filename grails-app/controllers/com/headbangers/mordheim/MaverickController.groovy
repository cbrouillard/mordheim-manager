package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MaverickController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_USER'])
    def create() {
        Maverick maverick = new Maverick(params)
        [bandId: params.band, maverickInstance: maverick]
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def save(Maverick maverickInstance) {
        if (maverickInstance == null) {
            notFound()
            return
        }

        def band = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (band == null) {
            redirect action: 'index', controller: 'band'
            return
        }

        if (maverickInstance.hasErrors()) {
            respond maverickInstance.errors, view: 'create'
            return
        }

        band.mavericks.add(maverickInstance)
        band.gold = band.gold - maverickInstance.cost
        band.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Maverick.label', default: 'Maverick'), maverickInstance.id])
                redirect controller: 'band', action: 'show', id: maverickInstance.band.id, params: [tab: 'maverick']
            }
            '*' { respond maverickInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USER'])
    def edit(Maverick maverickInstance) {
        respond maverickInstance
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def update(Maverick maverickInstance) {
        if (maverickInstance == null) {
            notFound()
            return
        }

        if (maverickInstance.hasErrors()) {
            respond maverickInstance.errors, view: 'edit'
            return
        }

        maverickInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Maverick.label', default: 'Maverick'), maverickInstance.id])
                redirect controller: 'band', action: 'show', id: maverickInstance.band.id, params: [tab: 'maverick']
            }
            '*' { respond maverickInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def delete(Maverick maverickInstance) {

        if (maverickInstance == null) {
            notFound()
            return
        }

        def band = maverickInstance.band
        maverickInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Maverick.label', default: 'Maverick'), maverickInstance.id])
                redirect action: "show", controller: "band", id: band.id, method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Maverick.label', default: 'Maverick'), params.id])
                redirect action: "index", method: "GET", controller: 'band'
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
