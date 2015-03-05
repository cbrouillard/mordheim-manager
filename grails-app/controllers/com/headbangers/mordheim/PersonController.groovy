package com.headbangers.mordheim

import com.headbangers.mordheim.security.Person
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 50, 100)
        respond Person.list(params), model: [personInstanceCount: Person.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Person personInstance) {
        respond personInstance
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Person(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'create'
            return
        }

        personInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Person personInstance) {
        respond personInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def toggle() {
        Person person = Person.get(params.id)
        if (person) {
            person.properties[params.t] = !person.properties[params.t]
            person.save(flush: true)
        }
        redirect(action: 'index')
        return
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'edit'
            return
        }

        personInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
