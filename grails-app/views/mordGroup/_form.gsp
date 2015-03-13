<%@ page import="com.headbangers.mordheim.MordGroup" %>

<div class="form-group ${hasErrors(bean: mordGroupInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="group.name.label"
                                                                default="Name"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${mordGroupInstance?.name}" class="form-control" autofocus=""/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>