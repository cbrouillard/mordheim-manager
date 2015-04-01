package com.headbangers.mordheim.reference

class RefWrench {

    static hasMany = [allowedEquipments : RefEquipmentWrench,
                      allowedCompetences: RefCompetenceWrench,
                      specialRules      : RefSpecialRule]

    static belongsTo = [Race]

    String type
    Integer maxInBand
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

    String equipment
    String rules

    Race race

    static constraints = {
        type nullable:false, blank: false
        maxInBand nullable:true
        startingExperience nullable:false
        costWithoutEquipment nullable: false
        equipment nullable: true, blank:false
        rules nullable:true, blank:false
    }

    Date dateCreated
}
