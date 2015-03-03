package com.headbangers.mordheim


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def wkhtmltoxService

    def index(Integer max) {
        params.max = Math.min(max ?: 12, 100)
        params.sort = params.sort ?: "dateCreated"
        params.order = params.order ?: "desc"
        respond Band.list(params), model: [bandInstanceCount: Band.count()]
    }

    def show(Band bandInstance) {
        respond bandInstance, model: [activeTab: params.tab]
    }

    def create() {
        respond new Band(params)
    }

    def pdf() {
        Band band = Band.get(params.id)
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

            /*response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "attachment;filename=\"${band.name}.pdf\"")
            response.outputStream << pdfData*/
            render(view: '/pdf/good', model: [band: band])
            return
        }

        redirect(action: 'index')
        return
    }

    @Transactional
    def save(Band bandInstance) {
        if (bandInstance == null) {
            notFound()
            return
        }

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

    def edit(Band bandInstance) {
        respond bandInstance
    }

    @Transactional
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
    def delete(Band bandInstance) {

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
