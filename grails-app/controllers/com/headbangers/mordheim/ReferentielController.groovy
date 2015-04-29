package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefCompetence
import com.headbangers.mordheim.reference.RefEquipment
import com.headbangers.mordheim.reference.RefHero
import com.headbangers.mordheim.reference.RefSpecialRule
import com.headbangers.mordheim.reference.RefWrench
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import java.sql.Ref

import static org.springframework.http.HttpStatus.CREATED

@Secured(['ROLE_SCRIBE'])
class ReferentielController {

    def index() {
        def races = Race.list([sort: 'name', order: "asc"])
        def equipments = RefEquipment.findAllByRace(null)
        def competences = RefCompetence.findAllByRace(null)

        render(view: 'index', model: [races: races, equipments: equipments, competences: competences])

    }

    def createrace() {
        Race race = new Race()
        respond race
    }

    def editrace() {
        Race race = Race.get(params.id)
        render(view: 'editrace', model: [raceInstance: race])
    }

    @Transactional
    def updaterace(Race raceInstance) {
        if (raceInstance.hasErrors()) {
            respond raceInstance.errors, view: 'editrace'
            return
        }

        raceInstance.save(flush: true)
        redirect(action: 'manage', id: raceInstance.id)
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
                redirect action: 'editrace', id: raceInstance.id
            }
            '*' { respond raceInstance, [status: CREATED] }
        }

    }

    def manage() {
        def race = Race.get(params.id)
        [raceInstance: race, tab: params.tab]
    }

    def askdeleterace() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index')
            return
        }

        render(template: 'askdeleterace', model: [race: race])
    }

    @Transactional
    def deleterace() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index')
            return
        }

        race.specialRules.clear()
        race.delete(flush: true)
        flash.message = "Race effacée."
        redirect(action: 'index')
    }

    @Transactional
    def toggleusable() {
        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index')
            return
        }

        race.usable = !race.usable
        race.save(flush: true)
        redirect(action: 'manage', id: race.id)
    }
}
