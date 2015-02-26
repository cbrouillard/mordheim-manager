<%@ page import="com.headbangers.mordheim.Wrenchmen" %>


<div class="form-group ${hasErrors(bean: wrenchmenInstance, field: 'number', 'has-error')}">
    <label for="number" class="col-sm-2 control-label"><g:message code="wrench.number.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-align-justify"></span></span>
            <g:field name="number" type="number" value="${wrenchmenInstance.number}" required="" class="form-control"
                     pattern="([0-9])*"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<jq:jquery>
    $('#number').focus()
</jq:jquery>


<div class="form-group ${hasErrors(bean: wrenchmenInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="wrench.name.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${wrenchmenInstance?.name}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>


<div class="form-group ${hasErrors(bean: wrenchmenInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="wrench.type.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>
            <g:textField name="type" required="" value="${wrenchmenInstance?.type}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group">

    <label class="col-sm-2 control-label"><g:message code="wrench.profile.label"/> *</label>

    <div class="col-sm-10">
        <g:render template="/profilable/editprofile" model="[profilable: wrenchmenInstance]"/>
        <div class="help-block with-errors"></div>
    </div>
</div>




<div class="form-group ${hasErrors(bean: wrenchmenInstance, field: 'equipment', 'has-error')} ${hasErrors(bean: wrenchmenInstance, field: 'speciaLRules', 'has-error')}">

    <label for="equipment" class="col-sm-2 control-label"><g:message code="wrench.equipment.label"/></label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="equipment" cols="40" rows="5" value="${wrenchmenInstance?.equipment}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

    <label for="specialRules" class="col-sm-2 control-label"><g:message code="wrench.specialRules.label"/></label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-lamp"></span></span>
            <g:textArea name="specialRules" cols="40" rows="5" value="${wrenchmenInstance?.specialRules}"
                        class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: wrenchmenInstance, field: 'note', 'has-error')}">

    <label for="note" class="col-sm-2 control-label"><g:message code="note.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-edit"></span></span>
            <g:textArea name="note" cols="40" rows="5" value="${wrenchmenInstance?.note}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>