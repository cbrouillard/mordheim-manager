package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_USER'])
class GameController {

    def springSecurityService

    class EndGameData {
        Map parameters
        Map wrenches
        Map heroes
        Map band
        Map mavericks
    }

    def endgame() {
        session['endGameData'] = new EndGameData()
        redirect action: "howto", id: params.id
    }

    def howto() {
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            render view: 'howto', model: [bandInstance: bandInstance]

        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    def go() {
        def bandInstance = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect(action: 'index', controller: 'band')
            return
        }

        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        gameData.parameters = params

        try {
            Integer.parseInt(gameData.parameters.xpRef)
        } catch (NumberFormatException e) {
            redirect action: 'howto', controller: 'endgame'
            return
        }

        redirect(action: 'deadwrench', id: params.band)
        return
    }

    def deadwrench() {

        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            render view: 'deadwrench', model: [bandInstance: bandInstance, parameters: gameData.parameters]

        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    def savedeadwrench() {
        def bandInstance = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect(action: 'index', controller: 'band')
            return
        }

        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        gameData.wrenches = params
        redirect(action: 'deadheroes', id: params.band)
        return
    }

    def deadheroes() {
        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {
            render view: 'deadheroes', model: [bandInstance: bandInstance, parameters: gameData.parameters]
        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    def savedeadheroes() {
        def bandInstance = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect(action: 'index', controller: 'band')
            return
        }

        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        gameData.heroes = params
        redirect(action: 'bandgains', id: params.band)
        return
    }

    def bandgains() {
        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            render view: 'bandgains', model: [bandInstance: bandInstance, parameters: gameData.parameters]

        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    def savebandgains() {
        def bandInstance = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect(action: 'index', controller: 'band')
            return
        }

        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        gameData.band = params
        redirect(action: bandInstance.mavericks ? 'deadmavericks' : 'recap', id: params.band)
        return
    }

    def deadmavericks() {
        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {
            render view: 'deadmavericks', model: [bandInstance: bandInstance, parameters: gameData.parameters]
        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    def savedeadmavericks() {
        def bandInstance = Band.findByIdAndOwner(params.band, springSecurityService.currentUser)
        if (!bandInstance) {
            redirect(action: 'index', controller: 'band')
            return
        }

        EndGameData gameData = session['endGameData']
        if (!gameData) {
            redirect(action: 'endgame', controller: 'game')
            return
        }

        gameData.mavericks = params
        redirect(action: 'recap', id: params.band)
        return
    }

    def recap() {
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            EndGameData gameData = session['endGameData']
            if (!gameData) {
                redirect(action: 'endgame', controller: 'game')
                return
            }

            render view: 'recap', model: [bandInstance: bandInstance, data: session["endGameData"], parameters: gameData.parameters]

        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    @Transactional
    def savegame() {

        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            EndGameData gameData = session['endGameData']
            if (!gameData) {
                redirect(action: 'endgame', controller: 'game')
                return
            }

            // saving
            Integer xpRef = new Integer(gameData.parameters.xpRef)
            savewrenches(bandInstance, gameData.wrenches, xpRef)
            saveHeroes(bandInstance, gameData.heroes, xpRef)
            saveBand(bandInstance, gameData.band)
            if (bandInstance.mavericks) {
                saveMavericks(bandInstance, gameData.mavericks, xpRef)
            }

            bandInstance.save(flush: true)

            session['endGameData'] = null

            flash.message = message(code: 'default.updated.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.name])
            redirect(controller: "band", action: 'show', id: bandInstance.id)
            return
        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    private def savewrenches(Band bandInstance, wrenchesData, Integer xpRef) {
        def toDelete = []
        bandInstance.wrenches.each { wrenches ->

            def status = wrenchesData.wrench[wrenches.id]
            def notin = wrenchesData.wrench[wrenches.id]["notin"]
            def bonus = wrenchesData[wrenches.id]["bonus"]
            def specialRules = wrenchesData[wrenches.id]["specialRules"]

            if (status) {
                def life = 0
                def death = 0
                status.each { k, v ->
                    if (v.equals("death")) {
                        death += 1
                    } else {
                        life += 1
                    }
                }

                log.debug "Wrench $wrenches.id life=$life && death=$death"

                if (!notin) {
                    if (death == wrenches.number) {
                        // everyone is dead.
                        bandInstance.removeFromWrenches(wrenches)
                        toDelete.add(wrenches)
                    } else {
                        wrenches.earnedXp += xpRef
                        // bonus
                        try {
                            def bonusInt = Integer.parseInt(bonus)
                            wrenches.earnedXp += bonusInt
                        } catch (NumberFormatException e) {
                            // osef
                        }
                        wrenches.number = life
                        wrenches.specialRules = specialRules
                    }
                }
            }
        }

        toDelete.each { bye ->
            bandInstance.removeFromWrenches(bye)
        }
        Wrenchmen.deleteAll(toDelete)
    }

    private def saveHeroes(Band bandInstance, heroesData, Integer xpRef) {
        def toDelete = []
        bandInstance.heroes.each { hero ->
            def infos = heroesData[hero.id]

            if (infos.state == "death") {
                // dead. so bad.
                toDelete.add(hero)
            } else if (infos.state == "notin") {

                //nothing.

            } else {
                // alive
                def earnedXp = xpRef

                // kills
                try {
                    def kill = Integer.parseInt(infos.kill)
                    earnedXp += kill > 0 ? kill : 0
                } catch (NumberFormatException e) {
                    // osef
                }

                // chief ?
                earnedXp += infos.victoriouschief ? 1 : 0

                // bonus
                try {
                    def bonus = Integer.parseInt(infos.bonus)
                    earnedXp += bonus
                } catch (NumberFormatException e) {
                    // osef
                }

                // bind data
                bindData(hero, infos, [include: ["injuries", "competences"]])
                hero.earnedXp += earnedXp
            }
        }

        toDelete.each { bye ->
            bandInstance.removeFromHeroes(bye)
        }
        Hero.deleteAll(toDelete)
    }

    private def saveMavericks(Band bandInstance, mavericksData, Integer xpRef) {
        def toDelete = []

        bandInstance.mavericks.each { maverick ->
            def infos = mavericksData[maverick.id]

            if (infos.state == "death") {
                // dead. so bad.
                toDelete.add(maverick)
            } else if (infos.state == "notin") {

                //nothing.

            } else {
                def earnedXp = xpRef

                // bonus
                try {
                    def bonus = Integer.parseInt(infos.bonus)
                    earnedXp += bonus
                } catch (NumberFormatException e) {
                    // osef
                }

                // bind data
                bindData(maverick, infos, [include: ["injuries", "competences"]])
                maverick.earnedXp += earnedXp
            }
        }

        toDelete.each { bye ->
            bandInstance.removeFromMavericks(bye)
        }
        Maverick.deleteAll(toDelete)
    }

    private def saveBand(Band bandInstance, bandData) {
        bindData(bandInstance, bandData, [include: ["reserve", "note"]])

        // ajouter gold et stones
        try {
            bandInstance.gold += Integer.parseInt(bandData["gold"])
            bandInstance.magicalStones += Integer.parseInt(bandData["magicalStones"])
        } catch (NumberFormatException e) {
            // osef
        }

        bandInstance.nbGame += 1
    }
}
