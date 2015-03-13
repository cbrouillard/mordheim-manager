package com.headbangers.mordheim

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MordGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 50, 100)
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
        def ownedCount = MordGroup.countByOwner(person)

        respond MordGroup.findAllByIsPublicAndEnabled(true, true, params),
                model: [mordGroupInstanceCount: MordGroup.countByIsPublicAndEnabled(true, true),
                        groups                : groups,
                        currentUser           : person,
                        ownedCount            : ownedCount]
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def asktojoin() {
        def group = MordGroup.get(params.id)
        if (group) {
            group.buddies.add(springSecurityService.currentUser)
            group.save(flush: true)

            flash.message = message(code: 'joined.group', args: [group.name])
        }

        redirect(action: 'index')
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def leave() {
        def group = MordGroup.get(params.id)
        if (group) {
            group.buddies.remove(springSecurityService.currentUser)
            group.save(flush: true)

            flash.message = message(code: 'quitted.group', args: [group.name])
        }

        redirect(action: 'index')
    }

    @Secured(['ROLE_USER'])
    def band() {
        def band = Band.get(params.id)
        if (!band) {
            redirect action: 'index'
            return
        }

        render(view: '/band/show', model: [bandInstance: band, anonymous: true])
    }

    @Secured(['ROLE_USER'])
    def create() {
        def ownedCount = MordGroup.countByOwner(springSecurityService.currentUser)
        if (ownedCount >= 1) {
            flash.message = message(code: "only.one.group")
            redirect(action: 'index')
        }

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
    def edit() {
        MordGroup mordGroupInstance
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
            mordGroupInstance = MordGroup.get(params.id)
        } else {
            mordGroupInstance = MordGroup.findByIdAndOwner(params.id, springSecurityService.currentUser)
        }

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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Group.label', default: 'MordGroup'), mordGroupInstance.name])
                redirect action: 'index'
            }
            '*' { respond mordGroupInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_USER'])
    def delete() {

        MordGroup mordGroupInstance
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
            mordGroupInstance = MordGroup.get(params.id)
        } else {
            mordGroupInstance = MordGroup.findByIdAndOwner(params.id, springSecurityService.currentUser)
        }

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
