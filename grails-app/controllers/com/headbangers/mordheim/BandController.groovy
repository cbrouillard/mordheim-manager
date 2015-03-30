package com.headbangers.mordheim

import com.headbangers.mordheim.security.Person
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def wkhtmltoxService
    def springSecurityService

    @Secured(['ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 12, 12)
        params.sort = params.sort ?: "dateCreated"
        params.order = params.order ?: "desc"

        def person = springSecurityService.currentUser

        respond Band.findAllByOwner(person, params), model: [bandInstanceCount: Band.countByOwner(person), person: person]
    }

    @Secured(['ROLE_USER'])
    def show() {
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        respond bandInstance, model: [activeTab: params.tab]
    }

    @Secured(['ROLE_USER'])
    def pdf() {
        Band band = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (band) {
            def byte[] pdfData = wkhtmltoxService.makePdf(
                    view: "/pdf/good",
                    model: [band: band],
                    //header: "/pdf/someHeader",
                    //footer: "/pdf/someFooter",
                    marginLeft: 0,
                    marginTop: 0,
                    marginBottom: 0,
                    marginRight: 0)

            /*def output = new FileOutputStream(new File("/home/cyril/${band.name}.pdf"))
            output << pdfData
            output.close()*/

            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "attachment;filename=\"${band.name}.pdf\"")
            response.outputStream << pdfData
            //render(view: '/pdf/good', model: [band: band])
            return
        }

        redirect(action: 'index')
        return
    }

    @Secured(['ROLE_USER'])
    def bbcode() {
        Band band = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (band) {
            render(view: 'bbcode', model: [bandInstance: band])
            return
        }
        redirect(action: 'index')
        return
    }


    @Secured(['ROLE_USER'])
    def previewpdf() {
        Band band = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (band) {
            render(view: '/pdf/good', model: [band: band])
            return
        }

        redirect(action: 'index')
        return
    }

    @Secured(['ROLE_USER'])
    def create() {
        Band band = new Band(params)
        band.owner = springSecurityService.currentUser
        respond band
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def save(Band bandInstance) {
        if (bandInstance == null) {
            notFound()
            return
        }

        bandInstance.owner = springSecurityService.currentUser
        bandInstance.gold = 500
        bandInstance.validate()

        if (bandInstance.hasErrors()) {
            respond bandInstance.errors, view: 'create'
            return
        }

        bandInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.name])
                redirect action: 'addhero', id: bandInstance.id
            }
            '*' { respond bandInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USER'])
    def addhero() {
        Band band = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (!band) {
            redirect action: 'index'
            return
        }

        Hero hero = new Hero(params)
        hero.band = band
        [bandId: params.id, heroInstance: hero]
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def savehero(Hero heroInstance) {

        def band = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (band == null) {
            redirect action: 'index', controller: 'band'
            return
        }

        if (heroInstance.hasErrors()) {
            respond heroInstance.errors, view: 'addhero'
            return
        }


        if (band.heroes.size() >= 6) {
            // nope, trop de héros.
            flash.message = message(code: 'too.many.hero')
            redirect(action: 'addwrench', id: band.id)
            return
        }

        band.heroes.add(heroInstance)
        band.gold = band.gold - heroInstance.cost
        band.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.name])
                redirect action: params.next, id: heroInstance.band.id
            }
            '*' { respond heroInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_USER'])
    def addwrench() {
        Band band = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (!band) {
            redirect action: 'index'
            return
        }

        Wrenchmen wrench = new Wrenchmen(params)
        wrench.band = band
        [bandId: params.id, wrenchmenInstance: wrench]
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def savewrench(Wrenchmen wrenchmenInstance) {

        def band = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (band == null) {
            redirect action: 'index', controller: 'band'
            return
        }

        if (wrenchmenInstance.hasErrors()) {
            respond wrenchmenInstance.errors, view: 'addwrench'
            return
        }

        if (band.wrenches.size() >= 6) {
            // nope, trop de wrench.
            flash.message = message(code: 'too.many.wrench.group')
            redirect(action: 'addhero', id: band.id)
            return
        }

        band.wrenches.add(wrenchmenInstance)
        band.gold = band.gold - wrenchmenInstance.cost
        band.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Wrenchmen.label', default: 'Hero'), wrenchmenInstance.name])
                redirect action: params.next, id: wrenchmenInstance.band.id
            }
            '*' { respond wrenchmenInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_USER'])
    def addmaverick() {
        Band band = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (!band) {
            redirect action: 'index'
            return
        }

        Maverick maverick = new Maverick(params)
        maverick.band = band
        [bandId: params.id, maverickInstance: maverick]
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def savemaverick(Maverick maverickInstance) {

        def band = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (band == null) {
            redirect action: 'index', controller: 'band'
            return
        }

        if (maverickInstance.hasErrors()) {
            respond maverickInstance.errors, view: 'addmaverick'
            return
        }

        band.mavericks.add(maverickInstance)
        band.gold = band.gold - maverickInstance.cost
        band.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Maverick.label'), maverickInstance.name])
                redirect action: params.next, id: maverickInstance.band.id
            }
            '*' { respond maverickInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_USER'])
    def edit() {
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect controller: 'band', action: 'index'
            return
        }
        respond bandInstance
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def update(Band bandInstance) {
        if (bandInstance == null) {
            notFound()
            return
        }

        if (bandInstance.hasErrors()) {
            respond bandInstance.errors, view: 'edit'
            return
        }

        bandInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.name])
                redirect bandInstance
            }
            '*' { respond bandInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def delete() {

        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        if (bandInstance == null) {
            notFound()
            return
        }

        bandInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.name])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Band.label', default: 'Band'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    protected boolean adminRight(def params) {
        boolean isAdmin = false
        Person person = springSecurityService.currentUser
        person.authorities.each { role ->
            if (role.authority.equals("ROLE_ADMIN")) {
                isAdmin = true
            }
        }

        return isAdmin && params.asAdmin
    }
}
