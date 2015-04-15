<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div class="row-fluid">
            <div class="col-sm-6">
                <h1>
                    ${raceInstance.name}
                </h1>
            </div>

            <div class="col-sm-6 clearfix text-right">
                <h1>

                    <g:link class="btn btn-warning" action="toggleusable" id="${raceInstance.id}">
                        <g:if test="${raceInstance.usable}">
                            <span class="glyphicon glyphicon-star"></span>
                            <g:message code="usable"/>
                        </g:if>
                        <g:else>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <g:message code="not.usable"/>
                        </g:else>
                    </g:link>

                    <div class="btn-group">
                        <g:link class="btn btn-success" action="editrace" id="${raceInstance.id}">
                            <span class="glyphicon glyphicon-edit"></span>
                        </g:link>
                        <g:link class="btn btn-danger" action="askdeleterace" id="${raceInstance.id}"
                                data-toggle="modal" data-target="#globalModal">
                            <span class="glyphicon glyphicon-remove"></span>
                        </g:link>
                    </div>
                </h1>
            </div>

            <g:if test="${flash.message}">
                <div class="alert alert-info" role="status">${flash.message}</div>
            </g:if>
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="col-sm-12">
        <hr/>
    </div>
</div>

<div class="col-12 col-sm-12 col-xs-12">

    <div role="tabpanel">

        <ul class="nav nav-tabs responsive" role="tablist">

            <li role="presentation">
                <a href="#specialRules" role="tab" data-toggle="tab">
                    <g:message code="referentiel.race.specialRules"/>
                    <button class="btn btn-success btn-xs"
                            onclick="document.location = '${createLink(controller: 'referentiel', action:'manageracerule', id: raceInstance.id)}'">
                        <span class="glyphicon glyphicon-cog"></span>
                    </button>
                </a>
            </li>

            <li role="presentation" class="active">
                <a href="#heroes" role="tab" data-toggle="tab">
                    <g:message code="heroes"/>
                    <button class="btn btn-success btn-xs"
                            onclick="document.location = '${createLink(controller: 'referentiel', action:'managehero', id: raceInstance.id)}'">
                        <span class="glyphicon glyphicon-cog"></span>
                    </button>
                </a>
            </li>

            <li role="presentation">
                <a href="#wrenches" role="tab" data-toggle="tab">
                    <g:message code="wrenches"/>
                    <button class="btn btn-success btn-xs"
                            onclick="document.location = '${createLink(controller: 'referentiel', action:'managewrench', id: raceInstance.id)}'">
                        <span class="glyphicon glyphicon-cog"></span>
                    </button>
                </a>
            </li>

        </ul>

        <div class="tab-content responsive">
            <div role="tabpanel" class="tab-pane" id="specialRules">
                &nbsp;
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table class="table">
                            <g:each in="${raceInstance.specialRules.sort({ it.name })}" var="rule">
                                <tr>
                                    <td><strong>${rule.name}</strong></td>
                                    <td>
                                        <div class="well">
                                            ${raw(rule.rule)}
                                        </div>
                                    </td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane active" id="heroes">
                &nbsp;
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th><g:message code="warrior.type.label"/></th>
                            <th><g:message code="informations"/></th>
                            <th><g:message code="profile.label"/></th>
                            <th><g:message code="warrior.equipment.label"/></th>
                            <th><g:message code="hero.competences.label.short"/></th>
                            <th class="text-right"><g:message code="actions"/> </th>
                        </tr>
                        </thead>
                        <g:each in="${raceInstance.heroes.sort({ it.type })}" var="hero">
                            <tr>
                                <td>
                                    ${hero.type}
                                </td>
                                <td>
                                    <span class="label label-default">MAX ${hero.maxInBand}</span>
                                    <span class="label label-default"><g:message code="band.gold"
                                                                                 args="[hero.costWithoutEquipment]"/></span>
                                    <span class="label label-default">${hero.startingExperience} XP</span>
                                </td>
                                <td>
                                    <g:render template="/profilable/showprofile" model="[warrior: hero]"/>
                                </td>
                                <td>
                                    <div class="well">
                                        ${raw(hero.equipment)}
                                    </div>
                                </td>
                                <td>
                                    <div class="well">
                                        ${raw(hero.competences)}
                                    </div>
                                </td>
                                <td class="text-right">
                                    <div class="btn-group">
                                        <g:link controller="referentiel" action="edithero" class="btn btn-success"
                                                id="${hero.id}">
                                            <span class="glyphicon glyphicon-edit"></span>
                                        </g:link>
                                        <g:link controller="referentiel" action="deletehero" class="btn btn-danger"
                                                id="${hero.id}">
                                            <span class="glyphicon glyphicon-remove"></span>
                                        </g:link>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div>

            </div>

            <div role="tabpanel" class="tab-pane" id="wrenches">
                &nbsp;
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table class="table">
                            <g:each in="${raceInstance.wrenches.sort({ it.type })}" var="wrench">
                                <tr>
                                    <td><strong>${wrench.type}</strong></td>
                                    <td>
                                        <span class="label label-default"><g:message code="band.gold"
                                                                                     args="[wrench.costWithoutEquipment]"/></span>
                                        <span class="label label-default">${wrench.startingExperience} XP</span>
                                    </td>
                                    <td>
                                        <g:render template="/profilable/showprofile" model="[warrior: wrench]"/>
                                    </td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>