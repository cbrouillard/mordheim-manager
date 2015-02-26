package com.headbangers.mordheim

class Hero {

    static belongsTo = [Band]

    String id

    String note

    Integer experience = 0
    Integer earnedXp = 0
    String equipment
    String competences
    String injuries

    Integer M = 0;
    Integer CC = 0;
    Integer CT = 0;
    Integer F = 0;
    Integer E = 0;
    Integer PV = 1;
    Integer I = 0;
    Integer A = 0;
    Integer CD = 0;

    String type
    String name

    Band band

    static constraints = {
        note nullable: true, blank: true, widget: 'textarea'
        competences nullable: true, blank: true, widget: 'textarea'
        injuries nullable: true, blank: true, widget: 'textarea'
        equipment nullable: true, blank: true, widget: 'textarea'
        experience nullable: false, defaultValue: 0
        earnedXp nullable:false, defaultValue:0
        type nullable: false, blank: false
        name nullable: false, blank: false
    }

    static mapping = {
        id generator: 'uuid'
        equipment type: 'text'
        note type: 'text'
        competences type: 'text'
        injuries type: 'text'
    }

    Date dateCreated
    Date lastUpdated

    Integer getFullXp (){
        return this.experience + this.earnedXp
    }
}
