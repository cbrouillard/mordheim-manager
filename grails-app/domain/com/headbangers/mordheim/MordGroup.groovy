package com.headbangers.mordheim

import com.headbangers.mordheim.security.Person

class MordGroup {

    static belongsTo = [Person]
    static hasMany = [buddies:Person]

    String id

    String name
    boolean isPublic = true
    boolean enabled = true

    Person owner

    static constraints = {
        name nullable: false, blank: false
        owner nullable:false
        isPublic nullable:false
        enabled nullable:false
    }

    static mapping = {
        id generator: 'uuid'
    }

    Date dateCreated
    Date lastUpdated
}
