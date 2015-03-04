package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HeroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_USER'])
    def create() {
        Hero hero = new Hero(params)
        [bandId: params.band, heroInstance: hero]
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def save(Hero heroInstance) {
        if (heroInstance == null) {
            notFound()
            return
        }

        def band = Band.get(params.band)
        if (band == null){
            redirect action: 'index', controller: 'band'
            return
        }

        if (heroInstance.hasErrors()) {
            respond heroInstance.errors, view: 'create'
            return
        }

        band.heroes.add(heroInstance)
        band.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'hero.label', default: 'Hero'), heroInstance.id])
                redirect controller: 'band', action:'show', id:band.id
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.id])
                redirect controller: 'band', action:'show', id:heroInstance.band.id
            }
            '*' { respond heroInstance, [status: OK] }
        }
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.id])
                redirect action: "show", controller: "band", id: band.id, method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hero.label', default: 'Hero'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
