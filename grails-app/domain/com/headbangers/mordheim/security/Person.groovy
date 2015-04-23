package com.headbangers.mordheim.security

import com.headbangers.mordheim.Band

class Person {

    transient springSecurityService

    static hasMany = [bands: Band]

    String id

    String username
    String password
    String email

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    String token

    boolean generateOnlyOnePDF = false

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email blank: false, nullable: false, unique: true
        token blank: false, nullable: false
        generateOnlyOnePDF nullable:false
    }

    static mapping = {
        password column: '`password`'
        id generator: 'uuid'
    }

    Set<Role> getAuthorities() {
        PersonRole.findAllByPerson(this).collect { it.role }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    Date dateCreated
    Date lastUpdated
}
