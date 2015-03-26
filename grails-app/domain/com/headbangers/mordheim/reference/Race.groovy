package com.headbangers.mordheim.reference

class Race {

    static hasMany = [specialRules: RefSpecialRule,
                      heroes      : RefHero,
                      wrenches    : RefWrench]

    String name

    Integer minFigures = 3
    Integer maxFigures = 20
    Integer initialTreasure = 500

    static constraints = {
        name nullable: false, blank: false
        minFigures nullable: false
        maxFigures nullable: false
        initialTreasure nullable: false
    }
}
