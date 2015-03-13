package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MordGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = params.sort ?: "dateCreated"
        params.order = params.order ?: "desc"

        // les groupes de l'utilisateur
        def person = springSecurityService.currentUser
        def c = MordGroup.createCriteria()
        def groups = c.list {
            buddies {
                eq("id", person.id)
            }
        }

        respond MordGroup.findAllByIsPublic(true, params), model: [mordGroupInstanceCount: MordGroup.countByIsPublic(true), groups: groups]
    }

    @Secured(['ROLE_USER'])
    def create() {
        respond new MordGroup(params)
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def save(MordGroup mordGroupInstance) {
        if (mordGroupInstance == null) {
            notFound()
            return
        }

        mordGroupInstance.owner = springSecurityService.currentUser
        mordGroupInstance.validate()

        if (mordGroupInstance.hasErrors()) {
            respond mordGroupInstance.errors, view: 'create'
            return
        }

        mordGroupInstance.buddies = new ArrayList<>()
        mordGroupInstance.buddies.add(springSecurityService.currentUser)
        mordGroupInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Group.label', default: 'MordGroup'), mordGroupInstance.name])
                redirect action: 'index'
            }
            '*' { respond mordGroupInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USER'])
    def edit(MordGroup mordGroupInstance) {
        respond mordGroupInstance
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def update(MordGroup mordGroupInstance) {
        if (mordGroupInstance == null) {
            notFound()
            return
        }

        if (mordGroupInstance.hasErrors()) {
            respond mordGroupInstance.errors, view: 'edit'
            return
        }

        mordGroupInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Group.label', default: 'MordGroup'), mordGroupInstance.id])
                redirect mordGroupInstance
            }
            '*' { respond mordGroupInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(MordGroup mordGroupInstance) {

        if (mordGroupInstance == null) {
            notFound()
            return
        }

        mordGroupInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Group.label', default: 'MordGroup'), mordGroupInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Group.label', default: 'MordGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
