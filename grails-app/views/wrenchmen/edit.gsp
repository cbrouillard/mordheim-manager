<%@ page import="com.headbangers.mordheim.Wrenchmen" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<div class="row-fluid">
    <div class="col-xs-12">
        <div>
            <h1><g:message
                    code="wrench.edit"/> <small><g:message code="wrench.edit.hint"/></small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${wrenchmenInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${wrenchmenInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>
</div>

<div class="col-xs-12">

    <g:form url="[resource: wrenchmenInstance, action: 'update']" class="form-horizontal" data-toggle="validator" method="PUT">
        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">
                    <g:render template="form"/>
                    <g:hiddenField name="version" value="${wrenchmenInstance?.version}" />
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </button>

                        <g:link class="btn btn-default" controller="band" action="show" id="${wrenchmenInstance?.band.id}" params="[tab:'wrench']">
                            <span class="glyphicon glyphicon-triangle-left"></span> <g:message
                                code="cancel"/>
                        </g:link>

                    </div>
                </div>
            </div>

        </div>

    </g:form>

</div>
</body>
</html>
