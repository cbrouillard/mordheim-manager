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
                ${raceInstance.name}
            </h1>
            <hr/>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
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