package com.headbangers.mordheim.reference

class RefEquipment {

    enum EquipmentType {
        CAC, SHOOT, ARMORY, ANY
    }

    EquipmentType type
    String name
    String rule
    Integer rareLevel

    // for special
    Race race

    static constraints = {
        type nullable: false
        name nullable: false
        rule nullable: true
        race nullable: true
        rareLevel nullable: true
    }
}
