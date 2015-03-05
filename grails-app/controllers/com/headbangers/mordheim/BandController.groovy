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
        params.max = Math.min(max ?: 12, 100)
        params.sort = params.sort ?: "dateCreated"
        params.order = params.order ?: "desc"
        respond Band.findAllByOwner(springSecurityService.currentUser, params), model: [bandInstanceCount: Band.countByOwner(springSecurityService.currentUser)]
    }

    @Secured(['ROLE_USER'])
    def foruser(Integer max) {
        Person person = Person.get(params.id)
        if (!person){
            redirect(controller: 'admin', action:'index')
            return
        }

        params.max = Math.min(max ?: 12, 100)
        params.sort = params.sort ?: "dateCreated"
        params.order = params.order ?: "desc"
        render(view: 'index',
                model: [bandInstanceList : Band.findAllByOwner(person, params),
                        bandInstanceCount: Band.countByOwner(person), asAdmin:true, person:person])
        return
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
    def create() {
        Band band = new Band(params)
        band.owner = springSecurityService.currentUser
        respond band
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

            def output = new FileOutputStream(new File("/home/cyril/${band.name}.pdf"))
            output << pdfData
            output.close()

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
    def previewpdf() {
        Band band = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (band) {
            render(view: '/pdf/good', model: [band: band])
            return
        }

        redirect(action: 'index')
        return
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def save(Band bandInstance) {
        if (bandInstance == null) {
            notFound()
            return
        }

        bandInstance.owner = springSecurityService.currentUser
        bandInstance.validate()

        if (bandInstance.hasErrors()) {
            respond bandInstance.errors, view: 'create'
            return
        }

        bandInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'band.label', default: 'Band'), bandInstance.id])
                redirect bandInstance
            }
            '*' { respond bandInstance, [status: CREATED] }
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.id])
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'band.label', default: 'Band'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
