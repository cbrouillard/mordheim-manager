package com.headbangers.mordheim

import com.headbangers.mordheim.security.Person

class Band {

    static belongsTo = [Person]

    String id

    static hasMany = [heroes   : Hero,
                      wrenches : Wrenchmen,
                      mavericks: Maverick]

    String note

    Long gold = 0
    Long magicalStones = 0

    String name
    String type
    String reserve
    Integer nbGame = 0

    Person owner

    byte[] photo

    static constraints = {
        note nullable: true, blank: true, widget: 'textarea'
        gold nullable: false, defaultValue: 0
        magicalStones nullable: false, defaultValue: 0
        name nullable: false, blank: false
        reserve nullable: true, blank: false, widget: 'textarea'
        photo nullable: true
        nbGame nullable: false
    }

    static mapping = {
        id generator: 'uuid'
        note type: 'text'
        reserve type: 'text'
    }

    Date dateCreated
    Date lastUpdated

    def getBandValue() {
        Long xp = 0
        heroes.each { h ->
            xp += 5
            xp += h.fullXp
        }
        wrenches.each { w ->
            xp += (w.number * 5)
            xp += (w.number * w.fullXp)
        }

        mavericks.each { m ->
            xp += m.bandSupValue
            xp += m.fullXp
        }

        return xp

    }

    def getNbWarriors() {
        Long number = 0
        number += this.heroes.size()
        number += getNbWrenches()
        return number
    }

    def getTotalXp() {
        Long xp = 0
        heroes.each { h ->
            xp += h.fullXp
        }
        wrenches.each { w ->
            xp += (w.fullXp * w.number)
        }
        mavericks.each {m ->
            xp += m.fullXp
        }

        return xp
    }

    def getNbWrenches() {
        Long number = 0
        wrenches.each { w ->
            number += w.number
        }
        return number
    }

    def getNbMavericks() {
        return this.mavericks.size()
    }

    def getMavericksSumValue() {
        Long value = 0
        mavericks.each { m ->
            value += m.bandSupValue
        }
        return value
    }
}
