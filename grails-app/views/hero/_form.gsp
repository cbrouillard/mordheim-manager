<%@ page import="com.headbangers.mordheim.Hero" %>

<div class="form-group ${hasErrors(bean: heroInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="warrior.type.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>
            <g:textField name="type" required="" value="${heroInstance?.type}" class="form-control" autofocus=""/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: heroInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="hero.name.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${heroInstance?.name}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<jq:jquery>
    $('#type').focus();
</jq:jquery>


<div class="form-group">

    <label class="col-sm-2 control-label"><g:message code="profile.label"/></label>

    <div class="col-sm-10">
        <g:render template="/profilable/editprofile" model="[profilable: heroInstance]"/>
        <div class="help-block with-errors"></div>
    </div>
</div>


<div class="form-group ${hasErrors(bean: heroInstance, field: 'equipment', 'has-error')} ${hasErrors(bean: heroInstance, field: 'competences', 'has-error')}">

    <label for="equipment" class="col-sm-2 control-label"><g:message code="warrior.equipment.label"/></label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="equipment" cols="40" rows="5" value="${heroInstance?.equipment}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

    <label for="competences" class="col-sm-2 control-label"><g:message code="hero.competences.label"/></label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-lamp"></span></span>
            <g:textArea name="competences" cols="40" rows="5" value="${heroInstance?.competences}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<g:if test="${params.action == 'edit'}">
    <div class="form-group ${hasErrors(bean: heroInstance, field: 'injuries', 'has-error')}">

        <label for="injuries" class="col-sm-2 control-label"><g:message code="hero.injuries.label"/></label>

        <div class="col-sm-10">
            <div class="input-group">
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-plus-sign"></span></span>
                <g:textArea name="injuries" cols="40" rows="5" value="${heroInstance?.injuries}"
                            class="form-control editor"/>
            </div>

            <div class="help-block with-errors"></div>
        </div>
    </div>

</g:if>


<div class="form-group ${hasErrors(bean: heroInstance, field: 'experience', 'has-error')} ${hasErrors(bean: heroInstance, field: 'earnedXp', 'has-error')}">

    <label for="experience" class="col-sm-2 control-label"><g:message code="experience.label"/> *</label>

    <div class="col-sm-${params.action == 'edit' ? '2' : '10'}">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-check"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="experience" type="number"
                     value="${heroInstance?.experience}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
            <g:message code="experience.start.hint"/>
        </div>

    </div>

    <g:if test="${params.action == 'edit'}">
        <div class="col-sm-8">
            <div class="input-group">
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-plus"></span></span>
                <g:field maxlength="2" pattern="^([0-9])*" name="earnedXp" type="number"
                         value="${heroInstance?.earnedXp}" required="" class="form-control" min="0"/>
            </div>

            <div class="help-block with-errors">
                <g:message code="experience.earned.hint"/>
            </div>
        </div>
    </g:if>
</div>

<div class="form-group ${hasErrors(bean: heroInstance, field: 'cost', 'has-error')}">

    <label for="cost" class="col-sm-2 control-label"><g:message code="cost.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-link"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="cost" type="number"
                     value="${heroInstance?.cost}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
            <g:if test="${params.action == 'edit'}">
                <g:message code="cost.hint.edit"/>
            </g:if>
            <g:else>
                <g:message code="cost.hint"/>
            </g:else>
        </div>
    </div>

</div>

<div class="form-group ${hasErrors(bean: heroInstance, field: 'note', 'has-error')}">

    <label for="note" class="col-sm-2 control-label"><g:message code="note.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-edit"></span></span>
            <g:textArea name="note" cols="40" rows="5" value="${heroInstance?.note}" class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>
