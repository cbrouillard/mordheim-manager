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
                    <tr class="${race.usable ? 'success' : ''}">
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

<div class="col-sm-8 col-xs-12">

    <div role="tabpanel">

        <ul class="nav nav-tabs responsive" role="tablist">
            <li role="presentation" class="active">
                <a href="#equipments" role="tab" data-toggle="tab">
                    <g:message code="referentiel.equipments"/>
                    <button class="btn btn-success btn-xs"
                            onclick="document.location = '${createLink(controller: 'referentielEquipment', action:'manage')}'">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </a>
            </li>

            <li role="presentation">
                <a href="#competences" role="tab" data-toggle="tab">
                    <g:message code="referentiel.competences"/>
                    <button class="btn btn-success btn-xs"
                            onclick="document.location = '${createLink(controller: 'referentielCompetence', action:'manage')}'">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </a>
            </li>

        </ul>

        <div class="tab-content responsive">
            <div role="tabpanel" class="tab-pane active" id="equipments">
                &nbsp;
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th><g:message code="name.label"/></th>
                            <th><g:message code="type.label"/></th>
                            <th><g:message code="equipment.rarity.level"/></th>
                            <th><g:message code="referentiel.race.specialRules"/></th>
                            <th class="text-right"><g:message code="actions"/></th>
                        </tr>
                        </thead>
                        <g:each in="${equipments}" var="equipment">
                            <tr>
                                <td><strong>${equipment.name}</strong></td>
                                <td><g:message code="EquipmentType.${equipment.type}"/></td>
                                <td>${equipment.rareLevel}</td>
                                <td>
                                    <div class="well">
                                        ${raw(equipment.rule)}
                                    </div>

                                </td>
                                <td class="text-right">
                                    <div class="btn-group">
                                        <g:link controller="referentielEquipment" action="edit" class="btn btn-success"
                                                id="${equipment.id}">
                                            <span class="glyphicon glyphicon-edit"></span>
                                        </g:link>
                                        <g:link controller="referentielEquipment" action="delete" class="btn btn-danger"
                                                id="${equipment.id}">
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:link>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane" id="competences">
                &nbsp;
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th><g:message code="name.label"/></th>
                            <th><g:message code="type.label"/></th>
                            <th><g:message code="referentiel.race.specialRules"/></th>
                            <th class="text-right"><g:message code="actions"/></th>
                        </tr>
                        </thead>
                        <g:each in="${competences}" var="competence">
                            <tr>
                                <td><strong>${competence.name}</strong></td>
                                <td><g:message code="CompetenceType.${competence.type}"/></td>
                                <td>
                                    <div class="well">
                                        ${raw(competence.rule)}
                                    </div>

                                </td>
                                <td class="text-right">
                                    <div class="btn-group">
                                        <g:link controller="referentielCompetence" action="edit" class="btn btn-success"
                                                id="${competence.id}">
                                            <span class="glyphicon glyphicon-edit"></span>
                                        </g:link>
                                        <g:link controller="referentielCompetence" action="delete"
                                                class="btn btn-danger"
                                                id="${competence.id}">
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:link>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div>

            </div>
        </div>

    </div>

</div>

</body>
</html>