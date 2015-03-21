package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class GameController {

    def springSecurityService

    def endgame() {
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

        StringBuffer recap = new StringBuffer(message(code:'wrench.endgame.recap'))

        bandInstance.wrenches.each { wrenches ->
            def status = params.wrench[wrenches.id]

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
                    recap.append(message(code:'wrench.endgame.recap.dead', args: [wrenches.name]))
                    bandInstance.removeFromWrenches(wrenches)
                    wrenches.delete()
                } else {
                    recap.append(message(code:'wrench.endgame.recap.alive', args: [wrenches.name, life]))
                    wrenches.earnedXp += 1
                    wrenches.number = life
                }
            }
        }

        recap.append(message (code: "wrench.endgame.recap.closemessage"))
        flash.message = recap.toString()
        bandInstance.save(flush: true)

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

        StringBuffer recap = new StringBuffer(message(code:'hero.endgame.recap'))
        bandInstance.heroes.each { hero ->
            def infos = params[hero.id]

            if (infos.state == "death") {
                // dead. so bad.
                recap.append (message(code:'hero.endgame.recap.death', args: [hero.name]))
                bandInstance.removeFromHeroes(hero)
                hero.delete()
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
                recap.append (message(code:'hero.endgame.recap.alive', args: [hero.name, earnedXp]))
            }
        }

        recap.append (message(code:'hero.endgame.recap.closemessage'))
        flash.message = recap.toString()
        bandInstance.save(flush: true)

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

        bindData(bandInstance, params, [include: ["reserve", "note"]])

        // ajouter gold et stones
        try {
            bandInstance.gold += Integer.parseInt("gold")
            bandInstance.magicalStones += Integer.parseInt("magicalStones")
        } catch (NumberFormatException e) {
            // osef
        }

        bandInstance.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'Band.label', default: 'Band'), bandInstance.name])
        redirect(controller: "band", action: 'show', id: params.band)
        return
    }
}
