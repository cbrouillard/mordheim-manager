<%@ page import="com.headbangers.mordheim.reference.RefEquipment" %>
<div class="form-group ${hasErrors(bean: refEquipmentInstance, field: 'type', 'has-error')}">

    <label for="type" class="col-sm-2 control-label"><g:message code="type.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>

            <g:select name="type" from="${RefEquipment.EquipmentType.values()}" valueMessagePrefix="EquipmentType"
                      class="form-control" autofocus=""/>

        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: refEquipmentInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="name.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${refEquipmentInstance?.name}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<jq:jquery>
    $('#type').focus();
</jq:jquery>

<div class="form-group ${hasErrors(bean: refEquipmentInstance, field: 'rareLevel', 'has-error')}">

    <label for="rareLevel" class="col-sm-2 control-label"><g:message code="equipment.rarity.level"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-check"></span></span>
            <g:field maxlength="2" pattern="^([0-9])*" name="rareLevel" type="number"
                     value="${refEquipmentInstance?.rareLevel}" required="" class="form-control" min="0"/>
        </div>

        <div class="help-block with-errors">
            <g:message code="equipment.rarity.level.hint"/>
        </div>

    </div>
</div>

<div class="form-group ${hasErrors(bean: refEquipmentInstance, field: 'rule', 'has-error')}">

    <label for="rule" class="col-sm-2 control-label"><g:message code="referentiel.race.specialRules"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="rule" cols="40" rows="5" value="${refEquipmentInstance?.rule}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

</div>