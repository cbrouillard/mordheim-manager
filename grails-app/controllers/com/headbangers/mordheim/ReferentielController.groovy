package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefCompetence
import com.headbangers.mordheim.reference.RefEquipment
import com.headbangers.mordheim.reference.RefHero
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

    def createhero() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index')
            return
        }
        RefHero refHero = new RefHero()
        respond refHero, model: [race: race]
    }

    @Transactional
    def savehero(RefHero refHeroInstance) {
        def race = Race.get(params.race)
        if (!race) {
            redirect(action: 'index')
            return
        }


        if (refHeroInstance.hasErrors()) {
            respond refHeroInstance.errors, view: 'create', model: [race: race]
            return
        }

        race.addToHeroes(refHeroInstance);
        race.save(flush: true)
        redirect(action: 'createhero', id: race.id)
        return
    }
}
