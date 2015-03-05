<%@ page import="com.headbangers.mordheim.security.Person" %>

<div class="form-group ${hasErrors(bean: personInstance, field: 'username', 'has-error')}">

    <label for="username" class="col-sm-2 control-label"><g:message code="person.username.label"
                                                                    default="Name"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-user"></span></span>
            <g:textField name="username" required="" value="${personInstance?.username}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group">

    <label for="email" class="col-sm-2 control-label"><g:message code="person.email.label"
                                                                 default="Email"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon">@</span>
            <g:textField name="email" required="" value="${personInstance?.email}" class="form-control"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group">

    <label for="passwordNew" class="col-sm-2 control-label"><g:message code="person.pass.label"
                                                                    default="Pass"/></label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-cog"></span></span>
            <g:passwordField name="passwordNew" class="form-control" data-match-error="${message(code:'pass.notmatch')}" data-match="#passwordCheck"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group">

    <div class="col-sm-10 col-sm-offset-2">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-cog"></span></span>
            <g:passwordField name="passwordCheck" class="form-control" data-match-error="${message(code:'pass.notmatch')}" data-match="#passwordNew"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

