package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefHero
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_SCRIBE'])
class ReferentielHeroController {

    def manage() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }
        RefHero refHero = new RefHero()
        respond refHero, model: [race: race, toAction: 'save']
    }

    @Transactional
    def save(RefHero refHeroInstance) {
        def race = Race.get(params.race)
        if (!race) {
            redirect(action: 'index', controller: "referentiel")
            return
        }


        if (refHeroInstance.hasErrors()) {
            respond refHeroInstance.errors, view: 'manage', model: [race: race, toAction: 'save']
            return
        }

        race.addToHeroes(refHeroInstance);
        race.save(flush: true)
        redirect(action: 'manage', id: race.id)
        return
    }

    @Transactional
    def delete() {
        def hero = RefHero.get(params.id)
        if (!hero) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        def raceId = hero.race.id
        hero.delete(flush: true)
        redirect(action: 'manage', id: raceId)
        return
    }

    def edit() {
        def hero = RefHero.get(params.id)
        if (!hero) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        render(view: 'manage', model: [refHeroInstance: hero, race: hero.race, toAction: "update"])
    }

    @Transactional
    def update() {
        def hero = RefHero.get(params.id)
        if (!hero) {
            redirect(action: 'index', controller: "referentiel")
            return
        }

        bindData(hero, params)
        if (hero.hasErrors()) {
            respond hero.errors, view: 'manage', model: [refHeroInstance: hero, race: hero.race, toAction: 'udpate']
            return
        }

        hero.save(flush: true)
        redirect(action: 'manage', id: params.race)
        return
    }
}
