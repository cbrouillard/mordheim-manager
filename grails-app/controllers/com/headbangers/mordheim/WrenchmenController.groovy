package com.headbangers.mordheim

import com.mordheim.helper.ImageHelper
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
    def promote() {
        def wrench = Wrenchmen.get(params.id)
        if (!wrench) {
            redirect(controller: "band", action: "index")
            return
        }

        if (wrench.band.heroes.size() >= 6) {
            flash.message = message(code: 'too.many.hero')
            redirect(controller: 'band', action: 'show', id: wrench.band.id, params: [tab: 'wrench'])
            return
        }

        Hero hero = new Hero()
        hero.experience = wrench.fullXp
        hero.band = wrench.band
        hero.competences = wrench.competences
        hero.cost = 0
        hero.equipment = wrench.equipment
        hero.name = wrench.name
        hero.note = wrench.note
        hero.type = wrench.type + ' ' + message(code: 'promoted')
        hero.M = wrench.M
        hero.CC = wrench.CC
        hero.CT = wrench.CT
        hero.F = wrench.F
        hero.E = wrench.E
        hero.A = wrench.A
        hero.PV = wrench.PV
        hero.I = wrench.I
        hero.CD = wrench.CD

        hero.save(flush:true)
        flash.message = message(code: 'wrench.has.been.promoted', args: [hero.name])

        if (wrench.number == 1) {
            wrench.delete(flush: true)
        } else {
            wrench.number -= 1
            wrench.save(flush: true)
        }

        redirect(controller: 'band', action: 'show', id: wrench.band.id)
        return
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

    @Secured(['ROLE_USER'])
    def changephoto() {
        def wrenchmenInstance = Wrenchmen.get(params.id)
        if (!wrenchmenInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        render(view: 'changephoto', model: [wrenchmenInstance: wrenchmenInstance])
        return
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def savephoto() {
        def wrenchmenInstance = Wrenchmen.get(params.id)
        if (!wrenchmenInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        if (params.set.equals('save')) {

            def f = request.getFile('photo')
            if (!ImageHelper.okcontents.contains(f.getContentType())) {
                flash.message = message(code: "wrong.mimetype", args: [ImageHelper.okcontents.toString()])
                redirect(action: 'changephoto', id: wrenchmenInstance.id)
                return
            }

            ByteArrayOutputStream out = new ByteArrayOutputStream()
            ImageHelper.resize(f.bytes, out, new Integer(55), new Integer(55))
            wrenchmenInstance.photo = out.toByteArray()

        } else {
            wrenchmenInstance.photo = null
        }

        wrenchmenInstance.save(flush: true)
        redirect(controller: 'band', action: 'show', id: wrenchmenInstance.band.id, params: [tab:'wrench'])
        return
    }

    @Secured(['ROLE_USER'])
    def photo() {
        def wrenchmenInstance = Wrenchmen.get(params.id)
        if (!wrenchmenInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        response.setContentType("image/jpeg")
        //response.setHeader("Content-disposition", "attachment;filename=\"${session.name}_ticket.pdf\"")
        response.outputStream << wrenchmenInstance.photo
        return
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
