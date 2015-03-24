package com.headbangers.mordheim


import grails.test.mixin.*
import spock.lang.*

@TestFor(MaverickController)
@Mock(Maverick)
class MaverickControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.maverickInstanceList
        model.maverickInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.maverickInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def maverick = new Maverick()
        maverick.validate()
        controller.save(maverick)

        then: "The create view is rendered again with the correct model"
        model.maverickInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        maverick = new Maverick(params)

        controller.save(maverick)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/maverick/show/1'
        controller.flash.message != null
        Maverick.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def maverick = new Maverick(params)
        controller.show(maverick)

        then: "A model is populated containing the domain instance"
        model.maverickInstance == maverick
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def maverick = new Maverick(params)
        controller.edit(maverick)

        then: "A model is populated containing the domain instance"
        model.maverickInstance == maverick
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/maverick/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def maverick = new Maverick()
        maverick.validate()
        controller.update(maverick)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.maverickInstance == maverick

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        maverick = new Maverick(params).save(flush: true)
        controller.update(maverick)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/maverick/show/$maverick.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/maverick/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def maverick = new Maverick(params).save(flush: true)

        then: "It exists"
        Maverick.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(maverick)

        then: "The instance is deleted"
        Maverick.count() == 0
        response.redirectedUrl == '/maverick/index'
        flash.message != null
    }
}
