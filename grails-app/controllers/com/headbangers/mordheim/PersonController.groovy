package com.headbangers.mordheim

import com.headbangers.mordheim.security.Person
import com.headbangers.mordheim.security.PersonRole
import com.headbangers.mordheim.security.Role
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", saveregistration: 'POST']

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 50, 100)
        respond Person.list(params), model: [personInstanceCount: Person.count()]
    }

    // anonymous access
    def register() {
        Person personInstance = new Person()
        respond personInstance
    }

    // anonymous access
    @Transactional
    def saveregistration(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (params.passwordNew && params.passwordCheck && params.passwordNew == params.passwordCheck) {
            personInstance.password = params.passwordNew
        }
        personInstance.token = UUID.randomUUID().toString();

        personInstance.validate()
        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'register'
            return
        }

        personInstance.enabled = false
        personInstance.save(flush: true)

        Role role = Role.findByAuthority("ROLE_USER")
        PersonRole.create(personInstance, role, true)

        sendMail {
            async true
            to personInstance.email
            subject message (code:'registration.email')
            html g.render(template:"/mail/registration", model: [person:personInstance])
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.registered.message', args: [personInstance.username, personInstance.email])
                chain (controller: 'login', action: 'auth')
            }
            '*' { respond personInstance, [status: OK] }
        }
    }

    // anonymous access
    @Transactional
    def validate() {
        Person person = Person.get(params.id)
        if (person && person.token == params.token) {
            person.enabled = true
            person.save(flush: true)

            sendMail {
                async true
                to "cyril.brouillard+mordheim@gmail.com"
                subject message (code:'new.registration.validated.email')
                html g.render(template:"/mail/heynewuser", model: [person:person])
            }

            flash.message = message(code: 'registration.over', args: [person.username])
            chain (controller: 'login', action: 'auth')
            return
        }

        redirect(controller: 'login')
        return
    }

    @Secured(['ROLE_USER'])
    def myprofile() {
        Person personInstance = springSecurityService.currentUser
        respond personInstance
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
    @Secured(['ROLE_USER'])
    def updateprofile() {
        Person personInstance = springSecurityService.currentUser

        personInstance.email = params.email
        if (params.passwordNew && params.passwordCheck && params.passwordNew == params.passwordCheck) {
            personInstance.password = params.passwordNew
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view: 'myprofile'
            return
        }

        personInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.username])
                redirect action: 'myprofile', methode: "GET"
            }
            '*' { respond personInstance, [status: OK] }
        }

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

        if (params.passwordNew && params.passwordCheck && params.passwordNew == params.passwordCheck) {
            personInstance.password = params.passwordNew
        }

        personInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.username])
                redirect action: 'index', methode: "GET"
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.username])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
