package com.headbangers.mordheim.reference

class RefEquipmentHero implements Serializable{

    private static final long serialVersionUID = 1
    
    RefHero hero
    RefEquipment equipment
    Integer cost = 0

    static constraints = {
        hero nullable: false
        equipment nullable: false
        cost nullable: false
    }

    static mapping = {
        id composite: ['hero', 'equipment']
        version false
    }
}
