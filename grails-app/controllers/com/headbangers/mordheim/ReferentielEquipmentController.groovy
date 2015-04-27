package com.headbangers.mordheim

import com.headbangers.mordheim.reference.Race
import com.headbangers.mordheim.reference.RefEquipment
import com.headbangers.mordheim.reference.RefEquipmentHero
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_SCRIBE'])
class ReferentielEquipmentController {

    def index() {
        redirect(action: 'manage')
    }

    def manage() {
        RefEquipment refEquipment = new RefEquipment([rareLevel: 0])
        def equipments = RefEquipment.findAll()
        respond refEquipment, model: [toAction: 'save', equipments: equipments]
    }

    @Transactional
    def save(RefEquipment equipment) {

        if (equipment.hasErrors()) {
            respond equipment.errors, view: 'manage', model: [equipments: RefEquipment.findAll(), toAction: 'save']
            return
        }

        equipment.save(flush: true)

        redirect(action: 'manage')
        return
    }

    @Transactional
    def delete() {
        def equipment = RefEquipment.get(params.id)
        if (!equipment) {
            redirect(action: 'index', controller: 'referentiel')
            return
        }

        equipment.delete(flush: true)
        redirect(action: 'manage')
        return
    }

    def edit() {
        def equipment = RefEquipment.get(params.id)
        if (!equipment) {
            redirect(action: 'index', controller: 'referentiel')
            return
        }

        render(view: 'manage', model: [refEquipmentInstance: equipment, equipments: RefEquipment.findAll(), toAction: "update"])
    }

    @Transactional
    def update() {
        def equipment = RefEquipment.get(params.id)
        if (!equipment) {
            redirect(action: 'index', controller: 'referentiel')
            return
        }

        bindData(equipment, params)
        if (equipment.hasErrors()) {
            respond equipment.errors, view: 'manage', model: [refEquipmentInstance: equipment, equipments: RefEquipment.findAll(), toAction: 'update']
            return
        }

        equipment.save(flush: true)
        redirect(action: 'manage')
        return
    }

    def manageheroes() {

        Race race = Race.get(params.id)
        if (!race) {
            redirect(action: 'index', controller: 'referentiel')
            return
        }

        RefEquipment refEquipment = new RefEquipment([rareLevel: 0])

        def equipments = RefEquipmentHero.list()
        respond refEquipment, model: [toAction: 'saveforhero', equipments: equipments, race:race]
    }
}
