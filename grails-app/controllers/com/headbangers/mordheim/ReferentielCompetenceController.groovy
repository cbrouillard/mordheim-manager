package com.headbangers.mordheim

import com.headbangers.mordheim.reference.RefCompetence
import com.headbangers.mordheim.reference.RefEquipment
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_SCRIBE'])
class ReferentielCompetenceController {

    def index() {
        redirect(action: 'manage')
    }

    def manage() {
        RefCompetence competence = new RefCompetence()
        def competences = RefCompetence.findAll()
        respond competence, model: [toAction: 'save', competences: competences]
    }

    @Transactional
    def save(RefCompetence competence) {

        if (competence.hasErrors()) {
            respond competence.errors, view: 'manage', model: [competences: RefCompetence.findAll(), toAction: 'save']
            return
        }

        competence.save(flush: true)
        redirect(action: 'manage')
        return
    }

    @Transactional
    def delete() {
        def competence = RefCompetence.get(params.id)
        if (!competence) {
            redirect(action: 'index', controller: 'referentiel')
            return
        }

        competence.delete(flush: true)
        redirect(action: 'manage')
        return
    }

    def edit() {
        def competence = RefCompetence.get(params.id)
        if (!competence) {
            redirect(action: 'index', controller: 'referentiel')
            return
        }

        render(view: 'manage', model: [refCompetenceInstance: competence, equipments: RefCompetence.findAll(), toAction: "update"])
    }

    @Transactional
    def update() {
        def competence = RefCompetence.get(params.id)
        if (!competence) {
            redirect(action: 'index', controller: 'referentiel')
            return
        }

        bindData(competence, params)
        if (competence.hasErrors()) {
            respond competence.errors, view: 'manage', model: [refCompetenceInstance: competence, equipments: RefCompetence.findAll(), toAction: 'update']
            return
        }

        competence.save(flush: true)
        redirect(action: 'manage')
        return
    }
}
