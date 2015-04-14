package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefHero
import com.mordheim.helper.ImageHelper
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HeroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_USER'])
    def create() {
        Hero hero = new Hero(params)
        hero.band = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        [bandId: params.band, heroInstance: hero]
    }

    @Secured(['ROLE_USER'])
    def loadhero (){
        RefHero refHero = RefHero.get(params.hero)
        if (refHero){
            Hero hero = new Hero()

            hero.type = refHero.type
            hero.M = refHero.M
            hero.CC = refHero.CC
            hero.CT = refHero.CT
            hero.F = refHero.F
            hero.E = refHero.E
            hero.PV = refHero.PV
            hero.I = refHero.I
            hero.A = refHero.A
            hero.CD = refHero.CD
            hero.equipment = refHero.equipment
            hero.competences = refHero.equipment
            hero.experience = refHero.startingExperience
            hero.cost = refHero.costWithoutEquipment

            render(template: "form", model: [heroInstance: hero])
        } else {
            render(template: "form", model: [heroInstance: new Hero()])
        }
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def save(Hero heroInstance) {
        if (heroInstance == null) {
            notFound()
            return
        }

        def band = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (band == null) {
            redirect action: 'index', controller: 'band'
            return
        }

        if (heroInstance.hasErrors()) {
            respond heroInstance.errors, view: 'create'
            return
        }

        band.heroes.add(heroInstance)
        band.gold = band.gold - heroInstance.cost
        band.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.name])
                redirect controller: 'band', action: 'show', id: band.id
            }
            '*' { respond heroInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USER'])
    def edit(Hero heroInstance) {
        respond heroInstance
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def update(Hero heroInstance) {
        if (heroInstance == null) {
            notFound()
            return
        }

        if (heroInstance.hasErrors()) {
            respond heroInstance.errors, view: 'edit'
            return
        }

        heroInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.name])
                redirect controller: 'band', action: 'show', id: heroInstance.band.id
            }
            '*' { respond heroInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_USER'])
    def askdelete() {
        Hero heroInstance = Hero.get(params.id)
        if (!heroInstance) {
            notFound()
            return
        }

        render(template: 'askdelete', model: [heroInstance: heroInstance])
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def delete(Hero heroInstance) {

        if (heroInstance == null) {
            notFound()
            return
        }

        def band = heroInstance.band
        heroInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.name])
                redirect action: "show", controller: "band", id: band.id, method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_USER'])
    def changephoto() {
        def heroInstance = Hero.get(params.id)
        if (!heroInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        render(view: 'changephoto', model: [heroInstance: heroInstance])
        return
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def savephoto() {
        def heroInstance = Hero.get(params.id)
        if (!heroInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        if (params.set.equals('save')) {

            def f = request.getFile('photo')
            if (!ImageHelper.okcontents.contains(f.getContentType())) {
                flash.message = message(code: "wrong.mimetype", args: [ImageHelper.okcontents.toString()])
                redirect(action: 'changephoto', id: heroInstance.id)
                return
            }

            ByteArrayOutputStream out = new ByteArrayOutputStream()
            ImageHelper.resize(f.bytes, out, new Integer(55), new Integer(55))
            heroInstance.photo = out.toByteArray()

        } else {
            heroInstance.photo = null
        }

        heroInstance.save(flush: true)
        redirect(controller: 'band', action: 'show', id: heroInstance.band.id)
        return
    }

    @Secured(['ROLE_USER'])
    def photo() {
        def heroInstance = Hero.get(params.id)
        if (!heroInstance) {
            redirect controller: 'band', action: 'index'
            return
        }

        response.setContentType("image/jpeg")
        //response.setHeader("Content-disposition", "attachment;filename=\"${session.name}_ticket.pdf\"")
        response.outputStream << heroInstance.photo
        return
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Hero.label', default: 'Hero'), params.id])
                redirect action: "index", method: "GET", controller: 'band'
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
