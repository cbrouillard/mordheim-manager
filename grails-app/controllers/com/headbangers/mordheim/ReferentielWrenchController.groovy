package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefWrench
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_SCRIBE'])
class ReferentielWrenchController {

    def manage() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }
        RefWrench refWrench = new RefWrench()
        respond refWrench, model: [race: race, toAction: 'save']
    }

    @Transactional
    def save(RefWrench refWrenchInstance) {
        def race = Race.get(params.race)
        if (!race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }


        if (refWrenchInstance.hasErrors()) {
            respond refWrenchInstance.errors, view: 'manage', model: [race: race, toAction: 'save']
            return
        }

        race.addToWrenches(refWrenchInstance);
        race.save(flush: true)
        redirect(action: 'manage', id: race.id)
        return
    }

    @Transactional
    def delete() {
        def wrench = RefWrench.get(params.id)
        if (!wrench) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        def raceId = wrench.race.id
        wrench.delete(flush: true)
        redirect(action: 'manage', id: raceId)
        return
    }

    def edit() {
        def wrench = RefWrench.get(params.id)
        if (!wrench) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        render(view: 'manage', model: [refWrenchInstance: wrench, race: wrench.race, toAction: "update"])
    }

    @Transactional
    def update() {
        def wrench = RefWrench.get(params.id)
        if (!wrench) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        bindData(wrench, params)
        if (wrench.hasErrors()) {
            respond wrench.errors, view: 'manage', model: [refWrenchInstance: wrench, race: wrench.race, toAction: 'update']
            return
        }

        wrench.save(flush: true)
        redirect(action: 'manage', id: params.race)
        return
    }
}
