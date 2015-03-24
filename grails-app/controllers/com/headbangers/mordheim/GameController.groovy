package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(['ROLE_USER'])
class GameController {

    def springSecurityService

    class EndGameData {
        Map wrenches
        Map heroes
        Map band
    }

    def endgame() {
        session['endGameData'] = new EndGameData()
        redirect action: "deadwrench", id: params.id
    }

    def deadwrench() {
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            render view: 'deadwrench', model: [bandInstance: bandInstance]

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
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {
            render view: 'deadheroes', model: [bandInstance: bandInstance]
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
        def bandInstance = Band.findByIdAndOwner(params.id, springSecurityService.currentUser)
        if (bandInstance) {

            render view: 'bandgains', model: [bandInstance: bandInstance]

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

            render view: 'recap', model: [bandInstance: bandInstance, data: session["endGameData"]]

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
            savewrenches(bandInstance, gameData.wrenches)
            saveHeroes(bandInstance, gameData.heroes)
            saveBand(bandInstance, gameData.band)

            bandInstance.save(flush: true)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.name])
            redirect(controller: "band", action: 'show', id: bandInstance.id)
            return
        } else {
            redirect action: 'index', controller: 'band'
            return
        }
    }

    private def savewrenches(Band bandInstance, wrenchesData) {
        def toDelete = []
        bandInstance.wrenches.each { wrenches ->
            def status = wrenchesData.wrench[wrenches.id]

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

                if (death == wrenches.number) {
                    // everyone is dead.
                    bandInstance.removeFromWrenches(wrenches)
                    toDelete.add(wrenches)
                } else {
                    wrenches.earnedXp += 1
                    wrenches.number = life
                }
            }
        }

        toDelete.each { bye ->
            bandInstance.removeFromWrenches(bye)
        }
        Wrenchmen.deleteAll(toDelete)
    }

    private def saveHeroes(Band bandInstance, heroesData) {
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
                def earnedXp = 1

                // kills
                try {
                    def kill = Integer.parseInt(infos.kill)
                    earnedXp += kill > 0 ? kill : 0
                } catch (NumberFormatException e) {
                    // osef
                }

                // chief ?
                earnedXp += infos.victoriouschief ? 1 : 0

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
