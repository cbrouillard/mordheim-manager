<div class="form-group ${hasErrors(bean: refHeroInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="hero.type.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>
            <g:textField name="type" required="" value="${refHeroInstance?.type}" class="form-control" autofocus=""/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<jq:jquery>
    $('#name').focus();
</jq:jquery>

<div class="form-group ${hasErrors(bean: refHeroInstance, field: 'maxInBand', 'has-error')}">

    <label for="maxInBand" class="col-sm-2 control-label"><g:message code="race.hero.maxInBand"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-info-sign"></span></span>
            <g:field type="number" name="maxInBand" required="" value="${refHeroInstance?.maxInBand}"
                     class="form-control"
                     min="0"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group">

    <label class="col-sm-2 control-label"><g:message code="hero.profile.label"/></label>

    <div class="col-sm-10">
        <g:render template="/profilable/editprofile" model="[profilable: refHeroInstance]"/>
        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: refHeroInstance, field: 'equipment', 'has-error')}">

    <label for="equipment" class="col-sm-2 control-label"><g:message code="hero.equipment.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="equipment" cols="40" rows="5" value="${refHeroInstance?.equipment}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

</div>


<div class="form-group ${hasErrors(bean: refHeroInstance, field: 'competences', 'has-error')}">
    <label for="competences" class="col-sm-2 control-label"><g:message code="hero.competences.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-lamp"></span></span>
            <g:textArea name="competences" cols="40" rows="5" value="${refHeroInstance?.competences}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: refHeroInstance, field: 'startingExperience', 'has-error')}">

    <label for="startingExperience" class="col-sm-2 control-label"><g:message code="experience.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-check"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="startingExperience" type="number"
                     value="${refHeroInstance?.startingExperience}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
            <g:message code="experience.start.hint"/>
        </div>

    </div>
</div>

<div class="form-group ${hasErrors(bean: refHeroInstance, field: 'costWithoutEquipment', 'has-error')}">

    <label for="costWithoutEquipment" class="col-sm-2 control-label"><g:message code="cost.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-link"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="costWithoutEquipment" type="number"
                     value="${refHeroInstance?.costWithoutEquipment}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
        </div>
    </div>

</div>
