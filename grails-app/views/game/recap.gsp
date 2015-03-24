<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div class="thumbnail pull-right">
            <asset:image src="Mordheim.gif" class="imgband"/>
        </div>

        <div>

            <h1>
                <g:message
                        code="band.end.games"/> <small>${bandInstance.name}</small>
            </h1>

            <hr/>

            <div class="clearfix">&nbsp;</div>
            <ol class="breadcrumb">
                <li><g:message code="end.wrenchmen.states"/></li>
                <li><g:message code="end.heroes.states"/></li>
                <li><g:message code="end.gains"/></li>
                <li class="active"><g:message code="end.recap"/></li>
            </ol>

        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-12 col-xs-12">
    <div class="alert alert-danger">
        <g:message code="please.verify.end.game"/>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="col-sm-4 col-xs-12">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h5><g:message code="end.wrenchmen.states"/></h5>
                    </div>

                    <div class="table-responsive">
                        <table class="table">
                            <g:each in="${bandInstance.wrenches.sort({ it.dateCreated })}" var="wrench">
                                <tr>
                                    <td><strong>${wrench.name}</strong> <span
                                            class="label label-default">#${wrench.number} ${wrench.type}</span></td>
                                    <td>
                                        <g:set var="infos" value="${data.wrenches.wrench[wrench.id]}"/>
                                        <g:set var="alive" value="${infos.count { it.value == 'life' }}"/>
                                        <g:set var="dead" value="${infos.count { it.value == 'death' }}"/>

                                        <g:if test="${alive}">
                                            <span class="label label-success"><g:message code="alive"
                                                                                         args="[alive]"/></span>
                                        </g:if>
                                        <g:if test="${dead}">
                                            <span class="label label-danger"><g:message code="dead"
                                                                                        args="[alive]"/></span>
                                        </g:if>
                                    </td>
                                    <td class="text-right">
                                        <g:if test="${alive}">
                                            +1 xp
                                        </g:if>
                                        <g:else>
                                            +0 xp
                                        </g:else>
                                    </td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-sm-5 col-xs-12">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h5><g:message code="end.heroes.states"/></h5>
                    </div>

                    <div class="table-responsive">
                        <table class="table">
                            <g:each in="${bandInstance.heroes.sort({ it.dateCreated })}" var="hero">
                                <tr>
                                    <td><strong>${hero.name}</strong>
                                        <span class="label label-default">${hero.type}</span>
                                    </td>
                                    <td>
                                        <g:set var="infos" value="${data.heroes[hero.id]}"/>
                                        <g:set var="xp" value="${new Integer(0)}"/>
                                        <g:if test="${infos.victoriouschief}">
                                            <span class="label label-success"><g:message code="victorious.hero"/></span>
                                            <g:set var="xp" value="${xp + 1}"/>
                                        </g:if>
                                        <g:if test="${infos.state == "life"}">
                                            <span class="label label-success"><g:message code="alive.hero"/></span>
                                            <g:set var="xp" value="${xp + 1}"/>
                                        </g:if>
                                        <g:set var="xp" value="${xp + new Integer(infos.kill)}"/>
                                        <span class="label label-default"><g:message code="hero.kill"
                                                                                     args="${infos.kill}"/></span>
                                        <g:if test="${infos.state == "death"}">
                                            <span class="label label-danger"><g:message code="dead.hero"/></span>
                                            <g:set var="xp" value="${new Integer(0)}"/>
                                        </g:if>
                                        <g:if test="${infos.state == "notin"}">
                                            <span class="label label-warning"><g:message code="notin.hero"/></span>
                                            <g:set var="xp" value="${new Integer(0)}"/>
                                        </g:if>

                                        <button type="button" class="btn btn-danger btn-xs" data-toggle="tooltip"
                                                data-placement="top"
                                                title="${infos.injuries ?: message(code: 'no.injuries')}">
                                            <g:message code="hero.injuries.label"/></button>
                                        <button type="button" class="btn btn-success btn-xs" data-toggle="tooltip"
                                                data-placement="top"
                                                title="${infos.competences ?: message(code: 'no.competences')}">
                                            <g:message code="hero.competences.label.short"/></button>
                                    </td>
                                    <td class="text-right">
                                        + ${xp} xp
                                    </td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-sm-3 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5><g:message code="end.gains"/></h5>
                    </div>

                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <td><strong><g:message code="band.gold.title"/></strong></td>
                                <td>
                                    + <g:message code="band.gold" args="[data.band.gold]"/>
                                </td>
                            </tr>
                            <tr>
                                <td><strong><g:message code="band.magical.stones.title"/></strong></td>
                                <td>
                                    + ${data.band.magicalStones}
                                </td>
                            </tr>
                            <tr>
                                <td><strong><g:message code="reserve.label"/></strong></td>
                                <td>
                                    <div class="well">
                                        ${raw(data.band.reserve)}
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><strong><g:message code="note.label"/></strong></td>
                                <td>
                                    <div class="well">
                                        ${raw(data.band.note)}
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-footer clearfix">

            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">

                    <div class="pull-right">
                        <span class="label label-danger"><g:message code="please.verify.end.game.tiny"/></span>
                        <g:link class="btn btn-success" action="savegame" controller="game" id="${bandInstance.id}">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </g:link>

                        <g:link class="btn btn-default" controller="band" action="show" id="${bandInstance.id}">
                            <span class="glyphicon glyphicon-triangle-left"></span> <g:message
                                code="cancel"/>
                        </g:link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jq:jquery>
    $('[data-toggle="tooltip"]').tooltip();
</jq:jquery>

</body>
</html>