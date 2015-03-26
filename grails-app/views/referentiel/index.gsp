<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div>

            <h1>
                <g:message
                        code="referentiel"/> <small><g:message code="referentiel.hint"/></small>
            </h1>
            <hr/>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-4 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <div class="btn-group pull-right" role="group">
                <g:link controller="referentiel" action="createrace" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span>
                </g:link>
            </div>
            <h5><g:message code="referentiel.races"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <g:each in="${races}" var="race">
                    <tr>
                        <td><strong>${race.name}</strong></td>
                        <td>
                            <span class="label label-default">${race.minFigures}&lt;=</span>
                            <span class="label label-default">=&gt;${race.maxFigures}</span>
                            <span class="label label-default"><g:message code="band.gold"
                                                                         args="${race.initialTreasure}"/></span>
                        </td>
                        <td class="text-right">
                            <g:link class="btn btn-default btn-xs" controller="referentiel" action="manage"
                                    id="${race.id}">
                                <g:message code="referentiel.manage"/>
                            </g:link>
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>

<div class="col-sm-4 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <div class="btn-group pull-right" role="group">
                <g:link controller="referentiel" action="createequipment" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span>
                </g:link>
            </div>
            <h5><g:message code="referentiel.equipments"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <g:each in="${equipments}" var="equipment">

                </g:each>
            </table>
        </div>
    </div>
</div>

<div class="col-sm-4 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <div class="btn-group pull-right" role="group">
                <g:link controller="referentiel" action="createcompetence" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span>
                </g:link>
            </div>
            <h5><g:message code="referentiel.competences"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <g:each in="${competences}" var="competence">

                </g:each>
            </table>
        </div>
    </div>
</div>

</body>
</html>