package com.headbangers.mordheim

import com.mordheim.helper.ImageHelper
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

    @Secured(['ROLE_USER'])
    def askdelete() {
        Maverick maverick = Maverick.get(params.id)
        if (!maverick) {
            notFound()
            return
        }

        render(template: 'askdelete', model: [maverick: maverick])
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

    @Secured(['ROLE_USER'])
    def changephoto() {
        def maverickInstance = Maverick.get(params.id)
        if (!maverickInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        render(view: 'changephoto', model: [maverickInstance: maverickInstance])
        return
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def savephoto() {
        def maverickInstance = Maverick.get(params.id)
        if (!maverickInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        if (params.set.equals('save')) {

            def f = request.getFile('photo')
            if (!ImageHelper.okcontents.contains(f.getContentType())) {
                flash.message = message(code: "wrong.mimetype", args: [ImageHelper.okcontents.toString()])
                redirect(action: 'changephoto', id: maverickInstance.id)
                return
            }

            ByteArrayOutputStream out = new ByteArrayOutputStream()
            ImageHelper.resize(f.bytes, out, new Integer(135), new Integer(135))
            maverickInstance.photo = out.toByteArray()

        } else {
            maverickInstance.photo = null
        }

        maverickInstance.save(flush: true)
        redirect(controller: 'band', action: 'show', id: maverickInstance.band.id, params: [tab: 'maverick'])
        return
    }

    // anonyme
    def photo() {
        def maverickInstance = Maverick.get(params.id)
        if (!maverickInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        response.setContentType("image/jpeg")
        //response.setHeader("Content-disposition", "attachment;filename=\"${session.name}_ticket.pdf\"")
        response.outputStream << maverickInstance.photo
        return
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
