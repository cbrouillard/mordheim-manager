package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefCompetence
import com.headbangers.mordheim.reference.RefEquipment
import com.headbangers.mordheim.reference.RefHero
import com.headbangers.mordheim.reference.RefWrench
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED

@Secured(['ROLE_SCRIBE'])
class ReferentielController {

    def index() {
        def races = Race.list([sort: 'name', order: "asc"])
        def equipments = RefEquipment.list()
        def competences = RefCompetence.list()

        render(view: 'index', model: [races: races, equipments: equipments, competences: competences])

    }

    def createrace() {
        Race race = new Race()
        respond race
    }

    @Transactional
    def saverace(Race raceInstance) {

        if (raceInstance.hasErrors()) {
            respond raceInstance.errors, view: 'createrace'
            return
        }

        raceInstance.save(flush: true)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'Race.label', default: 'Race'), raceInstance.name])
                redirect action: 'index'
            }
            '*' { respond raceInstance, [status: CREATED] }
        }

    }

    def manage() {
        def race = Race.get(params.id)
        [raceInstance: race]
    }

    // WRENCH
    def managewrench() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index')
            return
        }
        RefWrench refWrench = new RefWrench()
        respond refWrench, model: [race: race, toAction: 'savewrench']
    }

    @Transactional
    def savewrench(RefWrench refWrenchInstance) {
        def race = Race.get(params.race)
        if (!race) {
            redirect(action: 'index')
            return
        }


        if (refWrenchInstance.hasErrors()) {
            respond refWrenchInstance.errors, view: 'managewrench', model: [race: race, toAction: 'savewrench']
            return
        }

        race.addToWrenches(refWrenchInstance);
        race.save(flush: true)
        redirect(action: 'managewrench', id: race.id)
        return
    }

    @Transactional
    def deletewrench() {
        def wrench = RefWrench.get(params.id)
        if (!wrench) {
            redirect(action: 'index')
            return
        }

        def raceId = wrench.race.id
        wrench.delete(flush: true)
        redirect(action: 'managewrench', id: raceId)
        return
    }

    def editwrench() {
        def wrench = RefWrench.get(params.id)
        if (!wrench) {
            redirect(action: 'index')
            return
        }

        render(view: 'managewrench', model: [refWrenchInstance: wrench, race: wrench.race, toAction: "updatewrench"])
    }

    @Transactional
    def updatewrench() {
        def wrench = RefWrench.get(params.id)
        if (!wrench) {
            redirect(action: 'index')
            return
        }

        bindData(wrench, params)
        if (wrench.hasErrors()) {
            respond wrench.errors, view: 'managewrench', model: [refWrenchInstance: wrench, race: wrench.race, toAction: 'savewrench']
            return
        }

        wrench.save(flush: true)
        redirect(action: 'managewrench', id: params.race)
        return
    }

    // HERO
    def managehero() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index')
            return
        }
        RefHero refHero = new RefHero()
        respond refHero, model: [race: race, toAction: 'savehero']
    }

    @Transactional
    def savehero(RefHero refHeroInstance) {
        def race = Race.get(params.race)
        if (!race) {
            redirect(action: 'index')
            return
        }


        if (refHeroInstance.hasErrors()) {
            respond refHeroInstance.errors, view: 'managehero', model: [race: race, toAction: 'savehero']
            return
        }

        race.addToHeroes(refHeroInstance);
        race.save(flush: true)
        redirect(action: 'managehero', id: race.id)
        return
    }

    @Transactional
    def deletehero() {
        def hero = RefHero.get(params.id)
        if (!hero) {
            redirect(action: 'index')
            return
        }

        def raceId = hero.race.id
        hero.delete(flush: true)
        redirect(action: 'managehero', id: raceId)
        return
    }

    def edithero() {
        def hero = RefHero.get(params.id)
        if (!hero) {
            redirect(action: 'index')
            return
        }

        render(view: 'managehero', model: [refHeroInstance: hero, race: hero.race, toAction: "updatehero"])
    }

    @Transactional
    def updatehero() {
        def hero = RefHero.get(params.id)
        if (!hero) {
            redirect(action: 'index')
            return
        }

        bindData(hero, params)
        if (hero.hasErrors()) {
            respond hero.errors, view: 'managehero', model: [refHeroInstance: hero, race: hero.race, toAction: 'savehero']
            return
        }

        hero.save(flush: true)
        redirect(action: 'managehero', id: params.race)
        return
    }
}
