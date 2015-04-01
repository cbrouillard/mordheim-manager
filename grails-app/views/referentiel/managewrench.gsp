<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-xs-12">
        <div>
            <h1><g:message
                    code="referentiel.wrench.create"/> <small>${race.name}</small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${refWrenchInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${refWrenchInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>
</div>


<div class="col-sm-3 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <g:link controller="referentiel" action="manage" id="${race.id}" class="btn btn-default pull-right">
                <span class="glyphicon glyphicon-backward"></span> ${race.name}
            </g:link>

            <h5><g:message code="referentiel.already.created.wrenches"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <g:each in="${race.wrenches.sort({ it.type })}" var="wrench">
                    <tr>
                        <td><strong>${wrench.type}</strong></td>
                        <td class="text-right">
                            <div class="btn-group">
                                <g:link controller="referentiel" action="deletewrench" class="btn btn-danger btn-xs"
                                        id="${wrench.id}">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </g:link>
                                <g:link controller="referentiel" action="editwrench" class="btn btn-success btn-xs"
                                        id="${wrench.id}">
                                    <span class="glyphicon glyphicon-forward"></span>
                                </g:link>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>

<div class="col-sm-9 col-xs-12">
    <g:form url="[controller: 'referentiel', action: toAction]" class="form-horizontal" data-toggle="validator">
        <g:hiddenField name="race" value="${race.id}"/>
        <g:if test="${toAction.equals("updatewrench")}">
            <g:hiddenField name="id" value="${refWrenchInstance.id}"/>
        </g:if>
        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">
                    <g:render template="formwrench"/>
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