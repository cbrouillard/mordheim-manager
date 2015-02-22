package com.headbangers.mordheim



import grails.test.mixin.*
import spock.lang.*

@TestFor(WrenchmenController)
@Mock(Wrenchmen)
class WrenchmenControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.wrenchmenInstanceList
            model.wrenchmenInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.wrenchmenInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def wrenchmen = new Wrenchmen()
            wrenchmen.validate()
            controller.save(wrenchmen)

        then:"The create view is rendered again with the correct model"
            model.wrenchmenInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            wrenchmen = new Wrenchmen(params)

            controller.save(wrenchmen)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/wrenchmen/show/1'
            controller.flash.message != null
            Wrenchmen.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def wrenchmen = new Wrenchmen(params)
            controller.show(wrenchmen)

        then:"A model is populated containing the domain instance"
            model.wrenchmenInstance == wrenchmen
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def wrenchmen = new Wrenchmen(params)
            controller.edit(wrenchmen)

        then:"A model is populated containing the domain instance"
            model.wrenchmenInstance == wrenchmen
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/wrenchmen/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def wrenchmen = new Wrenchmen()
            wrenchmen.validate()
            controller.update(wrenchmen)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.wrenchmenInstance == wrenchmen

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            wrenchmen = new Wrenchmen(params).save(flush: true)
            controller.update(wrenchmen)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/wrenchmen/show/$wrenchmen.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/wrenchmen/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def wrenchmen = new Wrenchmen(params).save(flush: true)

        then:"It exists"
            Wrenchmen.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(wrenchmen)

        then:"The instance is deleted"
            Wrenchmen.count() == 0
            response.redirectedUrl == '/wrenchmen/index'
            flash.message != null
    }
}
