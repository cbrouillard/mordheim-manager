package com.headbangers.mordheim.reference

class RefSpecialRule {

    String name
    String rule

    static constraints = {
        name nullable: false, blank: false
        rule nullable: true, blank: false
    }
}
