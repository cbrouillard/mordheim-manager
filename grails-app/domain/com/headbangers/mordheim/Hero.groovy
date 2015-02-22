package com.headbangers.mordheim

class Hero {

    String id

    String note

    Integer experience = 0
    String equipment
    String competences
    String injuries

    Integer M;
    Integer CC;
    Integer CT;
    Integer F;
    Integer E;
    Integer PV;
    Integer I;
    Integer A;
    Integer CD;

    String type
    String name

    static constraints = {
        note nullable: true, blank: true, widget: 'textarea'
        competences nullable: true, blank: true, widget: 'textarea'
        injuries nullable: true, blank: true, widget: 'textarea'
        equipment nullable: true, blank: true, widget: 'textarea'
        experience nullable: false, defaultValue: 0
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
}
