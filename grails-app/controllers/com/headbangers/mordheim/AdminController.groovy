package com.headbangers.mordheim

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AdminController {

    def index(Integer max) {
        redirect(controller: 'person', action: 'index')
    }
}
