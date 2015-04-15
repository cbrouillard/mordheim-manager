<div class="form-group ${hasErrors(bean: refSpecialRuleInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="rule.name.label"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-asterisk"></span></span>
            <g:textField name="name" required="" value="${refSpecialRuleInstance?.name}" class="form-control"
                         autofocus=""/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<jq:jquery>
    $('#name').focus();
</jq:jquery>

<div class="form-group ${hasErrors(bean: refSpecialRuleInstance, field: 'rule', 'has-error')}">

    <label for="rule" class="col-sm-2 control-label"><g:message code="rule.content.label"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-scissors"></span></span>
            <g:textArea name="rule" cols="40" rows="5" value="${refSpecialRuleInstance?.rule}"
                        class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>

</div>

