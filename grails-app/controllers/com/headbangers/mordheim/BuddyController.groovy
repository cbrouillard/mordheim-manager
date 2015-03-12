package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

class BuddyController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index() {

        [person : springSecurityService.currentUser]

    }
}
