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

<div class="col-sm-3 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <div class="btn-group pull-right" role="group">
                <g:link controller="referentiel" action="createracerule" class="btn btn-success"
                        id="${raceInstance.id}">
                    <span class="glyphicon glyphicon-plus"></span>
                </g:link>
            </div>
            <h5>
                <g:message code="referentiel.race.specialRules"/>
            </h5>
        </div>
    </div>
</div>

<div class="col-sm-9 col-xs-12">
    <div class="row">
        <div class="col-sm-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <div class="btn-group pull-right" role="group">
                        <g:link controller="referentiel" action="managehero" class="btn btn-success"
                                id="${raceInstance.id}">
                            <span class="glyphicon glyphicon-cog"></span>
                        </g:link>
                    </div>
                    <h5>
                        <g:message code="heroes"/>
                    </h5>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <g:each in="${raceInstance.heroes.sort({ it.type })}" var="hero">
                            <tr>
                                <td><strong>${hero.type}</strong></td>
                                <td>
                                    <span class="label label-default"><g:message code="band.gold"
                                                                                 args="[hero.costWithoutEquipment]"/></span>
                                    <span class="label label-default">${hero.startingExperience} XP</span>
                                </td>
                                <td>
                                    <g:render template="/profilable/showprofile" model="[warrior: hero]"/>
                                </td>
                            </tr>
                        </g:each>
                    </table>
                </div>

            </div>
        </div>

        <div class="col-sm-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <div class="btn-group pull-right" role="group">
                        <g:link controller="referentiel" action="managewrench" class="btn btn-success"
                                id="${raceInstance.id}">
                            <span class="glyphicon glyphicon-cog"></span>
                        </g:link>
                    </div>
                    <h5>
                        <g:message code="wrenches"/>
                    </h5>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>