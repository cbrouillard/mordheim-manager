<%@ page import="com.headbangers.mordheim.Band" %>


<div class="form-group ${hasErrors(bean: bandInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="band.name.label"
                                                                default="Name"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${bandInstance?.name}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: bandInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="band.type.label"
                                                                default="Type"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>
            <g:textField name="type" required="" value="${bandInstance?.type}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: bandInstance, field: 'note', 'has-error')}">

    <label for="note" class="col-sm-2 control-label"><g:message code="note.label"
                                                                default="note"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-edit"></span></span>
            <g:textArea name="note" cols="40" rows="5" value="${bandInstance?.note}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>
