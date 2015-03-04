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

<jq:jquery>
    $('#name').focus();
</jq:jquery>

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

<g:if test="${params.action == 'edit'}">
    <div class="form-group ${hasErrors(bean: bandInstance, field: 'gold', 'has-error')}">

        <label for="gold" class="col-sm-2 control-label"><g:message code="band.gold.title"
                                                                    default="Type"/> *</label>

        <div class="col-sm-10">
            <div class="input-group">
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-euro"></span></span>
                <g:field type="number" name="gold" required="" value="${bandInstance?.gold}" class="form-control"/>
            </div>

            <div class="help-block with-errors"></div>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: bandInstance, field: 'magicalStones', 'has-error')}">

        <label for="magicalStones" class="col-sm-2 control-label"><g:message
                code="band.magical.stones.title"/> *</label>

        <div class="col-sm-10">
            <div class="input-group">
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-star"></span></span>
                <g:field type="number" name="magicalStones" required="" value="${bandInstance?.magicalStones}"
                         class="form-control"/>
            </div>

            <div class="help-block with-errors"></div>
        </div>
    </div>

    <div class="form-group ${hasErrors(bean: bandInstance, field: 'reserve', 'has-error')}">

        <label for="reserve" class="col-sm-2 control-label"><g:message code="reserve.label"/></label>

        <div class="col-sm-10">
            <div class="input-group">
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-scissors"></span></span>
                <g:textArea name="reserve" cols="40" rows="5" value="${bandInstance?.reserve}" class="form-control editor"/>
            </div>

            <div class="help-block with-errors"></div>
        </div>
    </div>
</g:if>

<div class="form-group ${hasErrors(bean: bandInstance, field: 'note', 'has-error')}">

    <label for="note" class="col-sm-2 control-label"><g:message code="note.label"
                                                                default="note"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-edit"></span></span>

            <g:textArea name="note" cols="40" rows="5" value="${bandInstance?.note}" class="form-control editor"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>
