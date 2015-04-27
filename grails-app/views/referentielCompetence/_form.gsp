<%@ page import="com.headbangers.mordheim.reference.RefCompetence" %>
<div class="form-group ${hasErrors(bean: refCompetenceInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="type.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>

            <g:select name="type" from="${RefCompetence.CompetenceType.values()}" valueMessagePrefix="CompetenceType"
                      class="form-control" autofocus=""/>

        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: refCompetenceInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="name.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${refCompetenceInstance?.name}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<jq:jquery>
    $('#type').focus();
</jq:jquery>

<div class="form-group ${hasErrors(bean: refCompetenceInstance, field: 'rule', 'has-error')}">

    <label for="rule" class="col-sm-2 control-label"><g:message code="referentiel.race.specialRules"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="rule" cols="40" rows="5" value="${refCompetenceInstance?.rule}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

</div>