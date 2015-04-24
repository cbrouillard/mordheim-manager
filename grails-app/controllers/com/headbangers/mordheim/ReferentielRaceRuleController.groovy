package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefSpecialRule
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional


@Secured(['ROLE_SCRIBE'])
class ReferentielRaceRuleController {

    def manage() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }
        RefSpecialRule refSpecialRule = new RefSpecialRule()
        respond refSpecialRule, model: [race: race, toAction: 'saveracerule']
    }


    @Transactional
    def save(RefSpecialRule rule) {
        def race = Race.get(params.race)
        if (!race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }


        if (rule.hasErrors()) {
            respond rule.errors, view: 'manage', model: [race: race, toAction: 'save']
            return
        }

        race.addToSpecialRules(rule);
        race.save(flush: true)
        redirect(action: 'manage', id: race.id)
        return
    }

    def edit() {
        def rule = RefSpecialRule.get(params.id)
        def race = Race.get(params.race)
        if (!rule || !race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        render(view: 'manage', model: [refSpecialRuleInstance: rule, race: race, toAction: "update"])
    }

    @Transactional
    def update(RefSpecialRule rule) {

        def race = Race.get(params.race)
        if (!race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        if (rule.hasErrors()) {
            respond rule.errors, view: 'manage', model: [race: race, toAction: 'update']
            return
        }

        rule.save(flush: true)
        redirect(action: 'manage', id: race.id)
        return
    }

    @Transactional
    def delete() {
        def rule = RefSpecialRule.get(params.id)
        def race = Race.get(params.race)
        if (!rule || !race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        race.removeFromSpecialRules(rule)
        rule.delete(flush: true)
        render(view: 'manage', model: [refSpecialRuleInstance: new RefSpecialRule(), race: race, toAction: "save"])
    }
}
