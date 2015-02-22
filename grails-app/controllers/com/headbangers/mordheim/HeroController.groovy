package com.headbangers.mordheim



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HeroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Hero.list(params), model:[heroInstanceCount: Hero.count()]
    }

    def show(Hero heroInstance) {
        respond heroInstance
    }

    def create() {
        respond new Hero(params)
    }

    @Transactional
    def save(Hero heroInstance) {
        if (heroInstance == null) {
            notFound()
            return
        }

        if (heroInstance.hasErrors()) {
            respond heroInstance.errors, view:'create'
            return
        }

        heroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'hero.label', default: 'Hero'), heroInstance.id])
                redirect heroInstance
            }
            '*' { respond heroInstance, [status: CREATED] }
        }
    }

    def edit(Hero heroInstance) {
        respond heroInstance
    }

    @Transactional
    def update(Hero heroInstance) {
        if (heroInstance == null) {
            notFound()
            return
        }

        if (heroInstance.hasErrors()) {
            respond heroInstance.errors, view:'edit'
            return
        }

        heroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.id])
                redirect heroInstance
            }
            '*'{ respond heroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Hero heroInstance) {

        if (heroInstance == null) {
            notFound()
            return
        }

        heroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Hero.label', default: 'Hero'), heroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hero.label', default: 'Hero'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
