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
                    code="referentiel.equipement.manage"/> <small></small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${refEquipmentInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${refEquipmentInstance}" var="error">
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
            <g:link controller="referentiel" action="index" class="btn btn-default pull-right">
                <span class="glyphicon glyphicon-backward"></span> <g:message code="back"/>
            </g:link>

            <h5><g:message code="referentiel.already.created.equipments"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <g:each in="${equipments.sort({ it.name })}" var="equipment">
                    <tr class="${equipment.id == refEquipmentInstance.id ? 'warning' : ''}">
                        <td><strong>${equipment.name}</strong></td>
                        <td><g:message code="EquipmentType.${equipment.type}"/> [${equipment.rareLevel}]</td>
                        <td class="text-right">
                            <div class="btn-group">
                                <g:link action="delete" class="btn btn-danger btn-xs"
                                        id="${equipment.id}">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </g:link>
                                <g:link action="edit" class="btn btn-success btn-xs"
                                        id="${equipment.id}">
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
    <g:form url="[controller: 'referentielEquipment', action: toAction]" class="form-horizontal" data-toggle="validator">
        <g:if test="${toAction.equals("update")}">
            <g:hiddenField name="id" value="${refEquipmentInstance.id}"/>
        </g:if>
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