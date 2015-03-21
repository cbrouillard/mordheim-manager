<%@ page import="com.headbangers.mordheim.security.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-xs-12">
        <div>
            <h1>
                <g:message
                    code="person.edit"/> <small><g:message code="person.edit.hint"/></small>

                <form action='${request.contextPath}/j_spring_security_switch_user'
                      method='POST' class="form-inline pull-right">
                    <g:hiddenField name="j_username" value="${personInstance.username}"/>
                    <button type="submit" class="btn btn-danger">
                        <span class="glyphicon glyphicon-user"></span> ${message(code: 'default.button.switch.label', default: 'Switch')}
                    </button>
                </form>
            </h1>

            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${personInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${personInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>
</div>

<div class="col-sm-4 col-xs-12">

    <div class="panel panel-info">
        <div class="panel-heading">
            <h5><g:message code="his.bands" args="[personInstance.username]"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <tbody>
                <g:set var="bands" value="${personInstance.bands}"/>
                <g:each in="${bands}" var="band">
                    <tr>
                        <td><g:formatDate date="${band.dateCreated}"/></td>
                        <td><strong>${band.name}</strong> <span class="label label-default">${band.type}</span></td>
                        <td class="text-right">
                            <div class="btn-group">
                                <g:link controller="admin" action="showband" id="${band.id}" class="btn btn-info btn-xs">
                                    <span class="glyphicon glyphicon-eye-open"></span>
                                </g:link>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="col-sm-8 col-xs-12">

    <g:form url="[resource: personInstance, action: 'update']" class="form-horizontal" data-toggle="validator"
            method="PUT">
        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </button>

                    </div>
                </div>
            </div>

        </div>

    </g:form>

</div>

</body>
</html>
