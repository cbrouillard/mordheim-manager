package com.headbangers.mordheim.reference

class RefMaverick {

    static hasMany = [allowedEquipments : RefEquipmentHero,
                      allowedCompetences: RefCompetenceHero,
                      specialRules      : RefSpecialRule]

    String type
    Integer startingExperience = 0

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
    Integer retenueCost
    Integer valueBandModifier

    String equipment
    String competences

    static constraints = {
        type nullable: false, blank: false
        startingExperience nullable: false
        costWithoutEquipment nullable: false
        retenueCost nullable: false
        valueBandModifier nullable: false
        equipment nullable:true, blank:false
        competences nullable:true, blank:false
    }

    Date dateCreated
}
