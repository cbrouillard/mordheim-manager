<%@ page import="com.headbangers.mordheim.Hero" %>

<div class="form-group ${hasErrors(bean: maverickInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="warrior.type.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>
            <g:textField name="type" required="" value="${maverickInstance?.type}" class="form-control" autofocus=""/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>


<div class="form-group ${hasErrors(bean: maverickInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="hero.name.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${maverickInstance?.name}" class="form-control"/>
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
        <g:render template="/profilable/editprofile" model="[profilable: maverickInstance]"/>
        <div class="help-block with-errors"></div>
    </div>
</div>


<div class="form-group ${hasErrors(bean: maverickInstance, field: 'equipment', 'has-error')} ${hasErrors(bean: maverickInstance, field: 'competences', 'has-error')}">

    <label for="equipment" class="col-sm-2 control-label"><g:message code="warrior.equipment.label"/></label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="equipment" cols="40" rows="5" value="${maverickInstance?.equipment}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

    <label for="competences" class="col-sm-2 control-label"><g:message code="hero.competences.label"/></label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-lamp"></span></span>
            <g:textArea name="competences" cols="40" rows="5" value="${maverickInstance?.competences}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<g:if test="${params.action == 'edit'}">
    <div class="form-group ${hasErrors(bean: maverickInstance, field: 'injuries', 'has-error')}">

        <label for="injuries" class="col-sm-2 control-label"><g:message code="hero.injuries.label"/></label>

        <div class="col-sm-10">
            <div class="input-group">
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-plus-sign"></span></span>
                <g:textArea name="injuries" cols="40" rows="5" value="${maverickInstance?.injuries}"
                            class="form-control editor"/>
            </div>

            <div class="help-block with-errors"></div>
        </div>
    </div>

</g:if>


<div class="form-group ${hasErrors(bean: maverickInstance, field: 'experience', 'has-error')} ${hasErrors(bean: maverickInstance, field: 'earnedXp', 'has-error')}">

    <label for="experience" class="col-sm-2 control-label"><g:message code="experience.label"/> *</label>

    <div class="col-sm-${params.action == 'edit' ? '2' : '10'}">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-check"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="experience" type="number"
                     value="${maverickInstance?.experience}" required="" class="form-control" min="0"/>
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
                         value="${maverickInstance?.earnedXp}" required="" class="form-control" min="0"/>
            </div>

            <div class="help-block with-errors">
                <g:message code="experience.earned.hint"/>
            </div>
        </div>
    </g:if>
</div>

<div class="form-group ${hasErrors(bean: maverickInstance, field: 'cost', 'has-error')}">

    <label for="cost" class="col-sm-2 control-label"><g:message code="cost.label"/> *</label>

    <div class="col-sm-8">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-link"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="cost" type="number"
                     value="${maverickInstance?.cost}" required="" class="form-control" min="0"/>
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

<div class="form-group ">
    <label for="bandSupValue" class="col-sm-2 control-label"><g:message code="bandSupValue.label"/> *</label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-link"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="bandSupValue" type="number"
                     value="${maverickInstance?.bandSupValue}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
            <g:message code="bandSupValue.hint"/>
        </div>
    </div>

    <label for="retenueCost" class="col-sm-2 control-label"><g:message code="retenueCost.label"/> *</label>

    <div class="col-sm-4">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-link"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="retenueCost" type="number"
                     value="${maverickInstance?.retenueCost}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
            <g:message code="retenueCost.hint"/>
        </div>
    </div>

</div>

<div class="form-group ${hasErrors(bean: maverickInstance, field: 'note', 'has-error')}">

    <label for="note" class="col-sm-2 control-label"><g:message code="note.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-edit"></span></span>
            <g:textArea name="note" cols="40" rows="5" value="${maverickInstance?.note}" class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>
