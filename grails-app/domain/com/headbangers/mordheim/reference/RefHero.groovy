package com.headbangers.mordheim.reference

class RefHero {

    static hasMany = [allowedEquipments : RefEquipmentHero,
                      allowedCompetences: RefCompetenceHero,
                      specialRules      : RefSpecialRule]

    static belongsTo = [Race]

    String type
    Integer maxInBand
    Integer startingExperience

    Integer M = 0;
    Integer CC = 0;
    Integer CT = 0;
    Integer F = 0;
    Integer E = 0;
    Integer PV = 1;
    Integer I = 0;
    Integer A = 0;
    Integer CD = 0;

    Integer costWithoutEquipment

    String equipment
    String competences

    Race race

    static constraints = {
        type nullable: false, blank: false
        maxInBand nullable: false
        startingExperience nullable: false
        costWithoutEquipment nullable: false
        equipment nullable:true, blank:false
        competences nullable:true, blank:false
    }

    Date dateCreated
}
