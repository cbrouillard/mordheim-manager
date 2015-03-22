package com.headbangers.mordheim.reference

class RefEquipmentWrench implements Serializable{

    private static final long serialVersionUID = 1

    RefWrench wrench
    RefEquipment equipment
    Integer cost

    static constraints = {
        wrench nullable: false
        equipment nullable: false
        cost nullable: false
    }

    static mapping = {
        id composite: ['wrench', 'equipment']
        version false
    }
}
