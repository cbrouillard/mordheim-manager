package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefCompetence
import com.headbangers.mordheim.reference.RefEquipment
import grails.plugin.springsecurity.annotation.Secured

class ReferentielController {

    @Secured(['ROLE_SCRIBE'])
    def index() {
        def races = Race.list()
        def equipments = RefEquipment.list()
        def competences = RefCompetence.list()

        render(view: 'index', model: [races: races, equipments: equipments, competences: competences])

    }
}
