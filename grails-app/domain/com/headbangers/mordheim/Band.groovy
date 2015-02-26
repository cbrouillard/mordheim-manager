package com.headbangers.mordheim

class Band {

    String id

    static hasMany = [heroes: Hero, wrenches: Wrenchmen]

    String note

    Long gold = 0
    Long magicalStones = 0

    String name
    String type
    String reserve

    static constraints = {
        note nullable: true, blank: true, widget: 'textarea'
        gold nullable: false, defaultValue: 0
        magicalStones nullable: false, defaultValue: 0
        name nullable: false, blank: false
        reserve nullable: true, blank: true, widget: 'textarea'
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
            xp += h.experience
        }
        wrenches.each { w ->
            xp += (w.number * 5)
            xp += w.experience
        }

        return xp

    }
}
