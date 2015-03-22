package com.headbangers.mordheim.reference

class RefCompetence {

    enum CompetenceType {
        COMBAT, TIR, ERUDITION, FORCE, VITESSE, SPECIAL
    }

    CompetenceType type
    String name
    String rule
    boolean buyable = false
    Integer cost

    // special
    Race race

    static constraints = {
        type nullable: false
        name nullable: false

        rule nullable: true
        race nullable: true
        cost nullable: true
    }
}
