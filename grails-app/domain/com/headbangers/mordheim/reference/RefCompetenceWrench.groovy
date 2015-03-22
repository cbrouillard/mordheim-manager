package com.headbangers.mordheim.reference

class RefCompetenceWrench implements Serializable{

    private static final long serialVersionUID = 1

    RefWrench wrench
    RefCompetence competence

    static constraints = {
        wrench nullable:false
        competence nullable: false
    }

    static mapping = {
        id composite: ['wrench', 'competence']
        version false
    }
}
