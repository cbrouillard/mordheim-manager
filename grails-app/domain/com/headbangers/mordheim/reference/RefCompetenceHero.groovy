package com.headbangers.mordheim.reference

class RefCompetenceHero implements Serializable{

    private static final long serialVersionUID = 1

    RefHero hero
    RefCompetence competence

    static constraints = {
        hero nullable: false
        competence nullable: false
    }

    static mapping = {
        id composite: ['hero', 'competence']
        version false
    }
}
