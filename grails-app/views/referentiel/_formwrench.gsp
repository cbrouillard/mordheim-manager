<div class="form-group ${hasErrors(bean: refWrenchInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="warrior.type.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>
            <g:textField name="type" required="" value="${refWrenchInstance?.type}" class="form-control" autofocus=""/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<jq:jquery>
    $('#type').focus();
</jq:jquery>


<div class="form-group ${hasErrors(bean: refWrenchInstance, field: 'maxInBand', 'has-error')}">

    <label for="maxInBand" class="col-sm-2 control-label"><g:message code="race.maxInBand"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-info-sign"></span></span>
            <g:field type="number" name="maxInBand" required="" value="${refWrenchInstance?.maxInBand}"
                     class="form-control"
                     min="0"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group">

    <label class="col-sm-2 control-label"><g:message code="profile.label"/></label>

    <div class="col-sm-10">
        <g:render template="/profilable/editprofile" model="[profilable: refWrenchInstance]"/>
        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: refWrenchInstance, field: 'equipment', 'has-error')}">

    <label for="equipment" class="col-sm-2 control-label"><g:message code="warrior.equipment.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="equipment" cols="40" rows="5" value="${refWrenchInstance?.equipment}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

</div>

<div class="form-group ${hasErrors(bean: refWrenchInstance, field: 'rules', 'has-error')}">
    <label for="rules" class="col-sm-2 control-label"><g:message code="wrench.specialRules.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-lamp"></span></span>
            <g:textArea name="rules" cols="40" rows="5" value="${refWrenchInstance?.rules}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: refWrenchInstance, field: 'startingExperience', 'has-error')}">

    <label for="startingExperience" class="col-sm-2 control-label"><g:message code="experience.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-check"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="startingExperience" type="number"
                     value="${refWrenchInstance?.startingExperience}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
            <g:message code="experience.start.hint"/>
        </div>

    </div>
</div>

<div class="form-group ${hasErrors(bean: refWrenchInstance, field: 'costWithoutEquipment', 'has-error')}">

    <label for="costWithoutEquipment" class="col-sm-2 control-label"><g:message code="cost.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-link"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="costWithoutEquipment" type="number"
                     value="${refWrenchInstance?.costWithoutEquipment}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
        </div>
    </div>

</div>
