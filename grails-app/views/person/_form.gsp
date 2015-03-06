<%@ page import="com.headbangers.mordheim.security.Person" %>

<g:if test="${params.action != 'myprofile'}">
    <div class="form-group ${hasErrors(bean: personInstance, field: 'username', 'has-error')}">

        <label for="username" class="col-sm-2 control-label"><g:message code="person.username.label"
                                                                        default="Name"/> *</label>

        <div class="col-sm-10">
            <div class="input-group">
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-user"></span></span>
                <g:textField name="username" required="" value="${personInstance?.username}" class="form-control" autofocus=""/>
            </div>

            <div class="help-block with-errors"></div>
        </div>
    </div>
</g:if>

<div class="form-group ${hasErrors(bean: personInstance, field: 'email', 'has-error')}">

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

<div class="form-group ${hasErrors(bean: personInstance, field: 'password', 'has-error')}">

    <label for="passwordNew" class="col-sm-2 control-label"><g:message code="person.pass.label"
                                                                       default="Pass"/> ${params.action.contains('regist') ? '*' : ''}</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-cog"></span></span>
            <g:if test="${params.action.contains('regist')}">
                <g:passwordField name="passwordNew" class="form-control" required=""/>
            </g:if>
            <g:else>
                <g:passwordField name="passwordNew" class="form-control"/>
            </g:else>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group">

    <div class="col-sm-10 col-sm-offset-2">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-cog"></span></span>
            <g:if test="${params.action.contains('regist')}">
                <g:passwordField name="passwordCheck" class="form-control"
                                 data-match-error="${message(code: 'pass.notmatch')}" data-match="#passwordNew" required=""/>
            </g:if>
            <g:else>
                <g:passwordField name="passwordCheck" class="form-control"
                                 data-match-error="${message(code: 'pass.notmatch')}" data-match="#passwordNew"/>
            </g:else>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

